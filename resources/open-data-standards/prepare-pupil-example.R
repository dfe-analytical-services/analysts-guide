library(dplyr)
library(tidyr)

# Run from the folder containing pupil-source.csv. Counts are synthetic and complete.
source_data <- read.csv("pupil-source.csv")

# Add codes from dfeR's maintained region lookup. Reject unmatched names.
regions <- dfeR::fetch_regions() |>
  filter(startsWith(region_code, "E12"))
if (!setequal(source_data$region_name, regions$region_name)) {
  stop("Source region names do not match the nine English regions in dfeR.")
}

# Turn the four count columns into two filters and one indicator.
detail <- source_data |>
  pivot_longer(
    cols = c(male_prim, male_sec, female_prim, female_sec),
    names_to = c("sex", "phase"), names_sep = "_", values_to = "pupil_count"
  ) |>
  left_join(regions, by = "region_name") |>
  transmute(
    time_period = gsub("/", "", academic_year, fixed = TRUE),
    region_code, region_name,
    education_phase = recode(phase, prim = "Primary", sec = "Secondary"),
    sex = recode(sex, male = "Male", female = "Female"),
    pupil_count
  )

# Add phase totals, then sex totals. Sum detail rows only at each step.
phase_totals <- detail |>
  group_by(time_period, region_code, region_name, sex) |>
  summarise(pupil_count = sum(pupil_count), .groups = "drop") |>
  mutate(education_phase = "All education phases")

regional <- bind_rows(detail, phase_totals)
sex_totals <- regional |>
  group_by(time_period, region_code, region_name, education_phase) |>
  summarise(pupil_count = sum(pupil_count), .groups = "drop") |>
  mutate(sex = "Total")
regional <- bind_rows(regional, sex_totals) |>
  mutate(geographic_level = "Regional")

# Sum matching regional rows to make England rows.
national <- regional |>
  group_by(time_period, education_phase, sex) |>
  summarise(pupil_count = sum(pupil_count), .groups = "drop") |>
  mutate(region_code = "", region_name = "", geographic_level = "National")

data <- bind_rows(regional, national) |>
  group_by(time_period, region_code, education_phase) |>
  mutate(pupil_percent = round(100 * pupil_count / pupil_count[sex == "Total"], 3)) |>
  ungroup() |>
  mutate(time_identifier = "Academic year",
         country_code = "E92000001", country_name = "England") |>
  arrange(time_period, region_code, education_phase, sex) |>
  select(time_period, time_identifier, geographic_level, country_code,
         country_name, region_code, region_name, education_phase,
         sex, pupil_count, pupil_percent)

write.csv(data, "pupil-enrolments.csv", row.names = FALSE, fileEncoding = "UTF-8")

metadata <- data.frame(
  col_name = c("education_phase", "sex", "pupil_count", "pupil_percent"),
  col_type = c("Filter", "Filter", "Indicator", "Indicator"),
  label = c("Education phase", "Sex", "Number of pupils", "Percentage of pupils"),
  indicator_grouping = "",
  indicator_unit = c("", "", "", "%"),
  indicator_dp = c("", "", "0", "1"),
  filter_hint = c("Select education phases", "Select pupil sex", "", ""),
  filter_grouping_column = "",
  filter_default = c("All education phases", "Total", "", "")
)
write.csv(metadata, "pupil-enrolments.meta.csv", row.names = FALSE, fileEncoding = "UTF-8")
