"""Prepare illustrative EES data from the wide source and region lookup CSVs."""

import pandas as pd

source = pd.read_csv("pupil-source.csv")
regions = pd.read_csv("pupil-region-lookup.csv", dtype=str)

if (
    len(regions) != 9
    or regions["region_name"].duplicated().any()
    or set(source["region_name"]) != set(regions["region_name"])
):
    raise ValueError("Source region names do not match the nine regions in the lookup")

# Turn the four count columns into two filters and one indicator.
detail = source.melt(
    id_vars=["academic_year", "region_name"],
    value_vars=["male_prim", "male_sec", "female_prim", "female_sec"],
    var_name="sex_phase",
    value_name="pupil_count",
)
detail[["sex", "phase"]] = detail["sex_phase"].str.split("_", expand=True)
detail["sex"] = detail["sex"].map({"male": "Male", "female": "Female"})
detail["education_phase"] = detail["phase"].map(
    {"prim": "Primary", "sec": "Secondary"}
)
detail["time_period"] = detail["academic_year"].str.replace("/", "", regex=False)
detail = detail.merge(regions, on="region_name", validate="many_to_one")
detail = detail[
    ["time_period", "region_code", "region_name", "education_phase", "sex", "pupil_count"]
]

# Add phase totals from detail rows, then sex totals from those rows.
phase_totals = detail.groupby(
    ["time_period", "region_code", "region_name", "sex"], as_index=False
)["pupil_count"].sum()
phase_totals["education_phase"] = "All education phases"
regional = pd.concat([detail, phase_totals], ignore_index=True)

sex_totals = regional.groupby(
    ["time_period", "region_code", "region_name", "education_phase"], as_index=False
)["pupil_count"].sum()
sex_totals["sex"] = "Total"
regional = pd.concat([regional, sex_totals], ignore_index=True)
regional["geographic_level"] = "Regional"

# Sum matching regional rows to make England rows.
national = regional.groupby(
    ["time_period", "education_phase", "sex"], as_index=False
)["pupil_count"].sum()
national["region_code"] = ""
national["region_name"] = ""
national["geographic_level"] = "National"
data = pd.concat([regional, national], ignore_index=True)

# Each percentage uses the sex total for the same year, place and phase.
keys = ["time_period", "region_code", "education_phase"]
totals = data.loc[data["sex"] == "Total", keys + ["pupil_count"]]
totals = totals.rename(columns={"pupil_count": "denominator"})
data = data.merge(totals, on=keys, validate="many_to_one")
data["pupil_percent"] = (100 * data["pupil_count"] / data["denominator"]).round(3)
data["time_identifier"] = "Academic year"
data["country_code"] = "E92000001"
data["country_name"] = "England"

columns = [
    "time_period", "time_identifier", "geographic_level", "country_code",
    "country_name", "region_code", "region_name", "education_phase", "sex",
    "pupil_count", "pupil_percent",
]
data = data[columns].sort_values(
    ["time_period", "region_code", "education_phase", "sex"]
)
data.to_csv("pupil-enrolments.csv", index=False, encoding="utf-8")

metadata = pd.DataFrame({
    "col_name": ["education_phase", "sex", "pupil_count", "pupil_percent"],
    "col_type": ["Filter", "Filter", "Indicator", "Indicator"],
    "label": ["Education phase", "Sex", "Number of pupils", "Percentage of pupils"],
    "indicator_grouping": ["", "", "", ""],
    "indicator_unit": ["", "", "", "%"],
    "indicator_dp": ["", "", "0", "1"],
    "filter_hint": ["Select education phases", "Select pupil sex", "", ""],
    "filter_grouping_column": ["", "", "", ""],
    "filter_default": ["All education phases", "Total", "", ""],
})
metadata.to_csv("pupil-enrolments.meta.csv", index=False, encoding="utf-8")
