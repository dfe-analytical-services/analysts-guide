[![Publish to pages](https://github.com/dfe-analytical-services/analysts-guide/actions/workflows/publish.yml/badge.svg?branch=main)](https://github.com/dfe-analytical-services/analysts-guide/actions/workflows/publish.yml)

# Analysts' Guide

## Introduction

A quarto-based static website used as a central place to hold guidance, helpful links and code examples for analysts working in DfE. The source repository is hosted in GitHub and deployed via GitHub pages.

---

## Hosted environments

The guidance website is deployed to https://dfe-analytical-services.github.io/analysts-guide/.

---

## Requirements

### i. Software requirements 

- See [getting started with Quarto](https://quarto.org/docs/get-started/)

### ii. Programming skills required

- Basic knowledge of [Quarto](https://rmarkdown.rstudio.com/articles_intro.html) and markdown

- Understanding of [Quarto websites](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html)
  
### iii. Access

- A number of internal DfE videos are embedded, unless you have specific access via DfE kit they will not appear. If you are interested in their content please get in touch with us.

---

## How to use

Each page of the site is a single quarto document, with index.qmd as the homepage. When the project is opened locally in RStudio you will be able to preview the website by typing the command `quarto preview` into the terminal or using `quarto::quarto_preview()` in the R console.

### Tests

There are currently no automated tests on this project.

### Diagrams

RAP Hexagons - https://app.diagrams.net/#G1usTSACWv_gRBgibnKRK52ksOksF303Dv

RAP Badges - https://app.diagrams.net/#G1uSCknFwmzhy-YHZTGmkuqoMM_zDH2yC0

Create release - https://app.diagrams.net/#G1NcVNEtMtNO--2NtV6RPxceiRv3fDGQ7y

PRA - https://app.diagrams.net/#G1x1VLZghqCCnmDWHqgjpdU6fSSehms4FL

ADA diagram - https://app.diagrams.net/?libs=general;flowchart#G1oL9XauLLcVVbF5O_qzZhtcqQbPW9myJk

The diagrams are amended on the links above. Once you have finished amending a diagram, go to 
file > Embed > HTML. Leave the option of 'Include a copy of my diagram selected', change the 
boarder colour to none and untick the rest of the options. Press create and copy and paste the HTML 
code over the top of the existing code in the .qmd file.
---

## Contribution

Pages from this guide have different code owners, their review will automatically be sought on any contributions you make. For full details of the codeowners in this repo, see the [.github/CODEOWNERS file](https://github.com/dfe-analytical-services/analysts-guide/blob/main/.github/CODEOWNERS).

If you're interested in contributing to this project, have a read of the [contributing guidelines](https://github.com/dfe-analytical-services/analysts-guide/blob/main/CONTRIBUTING.md).

---

## Past versions

---

For ease of record keeping and slight nostalgia, past iterations of the site prior to the move to this repo in October 2023 have been listed below:

- July 2023, [Statisticians Guide, Quarto site used until name change, available on GitHub](https://github.com/dfe-analytical-services/statisticians-guide)

- April 2023, [Quarto prototype](https://github.com/dfe-analytical-services/stats-production-guidance-quarto)

- Feb 2023, [Ruby prototype](https://github.com/dfe-analytical-services/dfe-stats-production-guidance)

- March 2021, [Stats Production Guidance - RMarkdown website, public facing clone on GitHub](https://github.com/dfe-analytical-services/stats-production-guidance-copy)

- March 2020, [Stats Production Guidance - RMarkdown website, code available on Azure DevOps - internal to DfE](https://dfe-gov-uk.visualstudio.com/stats-development/_git/stats-production-guidance)

- March 2020, [RAP bookdown site, code available on Azure DevOps - internal to DfE](https://dfe-gov-uk.visualstudio.com/stats-development/_git/RAP-Guidance-Stats-Production)

- Before this it was a bunch of loose Word documents.

---

## Contact

statistics.development@education.gov.uk.