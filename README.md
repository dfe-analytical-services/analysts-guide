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

Each page of the site is a single quarto document, with index.qmd as the homepage. When the project is opened locally in RStudio you will be able to preview the whole website using one of the following options:

1. (In R Studio) clicking 'build site' in the build pane

2. Run `quarto preview` in the terminal, adding `--render all` at the end if you want to pre-render the whole site like the R Studio option does (slower initially, but faster to navigate through multiple pages)

3. Using `quarto::quarto_preview()` if in an R console with the quarto R package installed, `render = "All"` gives the equivalent behaviour to `--render all` in the terminal

### Tests

There are currently no automated tests on this project.

### Diagrams

RAP Hexagons - https://app.diagrams.net/#G1usTSACWv_gRBgibnKRK52ksOksF303Dv

RAP Badges - https://app.diagrams.net/#G1uSCknFwmzhy-YHZTGmkuqoMM_zDH2yC0

Create release - https://app.diagrams.net/#G1NcVNEtMtNO--2NtV6RPxceiRv3fDGQ7y

PRA - https://app.diagrams.net/#G1x1VLZghqCCnmDWHqgjpdU6fSSehms4FL

ADA diagram - https://app.diagrams.net/?libs=general;flowchart#G1oL9XauLLcVVbF5O_qzZhtcqQbPW9myJk

Git Flow diagram - [Draw.io file](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=git_command_diagram.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22i6ysLSBwcMiQD9jihEgu%22%3E7V1tk5s4Ev41rko%2BOAWIN3%2F0jGd2U5XcppK92t1PVzIImxtseQF7PPfrT0ISBiFsTHjxzI5TNcYCBDxPd6u71SgTcL85%2FhLD3for9lE0MTT%2FOAGLiUE%2BpkW%2BaMsLa3FmGmtYxaHPmvRTw4%2Fwf4g3isP2oY%2BS0oEpxlEa7sqNHt5ukZeW2mAc4%2BfyYQGOylfdwRWqNPzwYFRt%2FSP00zVrdQ3n1P4rCldrcWXdnrE9GygO5k%2BSrKGPnwtN4GEC7mOMU7a1Od6jiIIncGHnPdbszW8sRtu0yQnf%2Ff%2F863fj8H3%2B5eHz4h7%2B9tl3H6aWUe2G95ykLwKEGO%2B3PqL96BNw97wOU%2FRjBz2695nQTtrW6Sbiuw8oTkMC4DwKV1vSlmJ6AIw9Tq5GfrErHGC051eYGHZELn8XYHIXxWvbf%2B%2Bx2DFNsh7m5AByx8esH7GfbK3oNyA7f6SElYRscHFkXRNkWO%2FsQH4L5GbRsfDcHLtfEN6gNH4hh6wL9FomJ%2FP5JAu2w9t4N1MhupCL3irv68QO2eAEXUGWbndOVgSXKPqGkzANMSXLIx2juMDiF%2BmATej79Ep3kNNbOUPwvsRpijeUujCK7nGE4%2Bz%2BANJ9CzmkPUlj%2FIQKe2a2A6DdhXjodo14fMHkDruUCNOuSgRwyxJh8Z%2FcBNq9ycesd2XOSVVQ1AY9vYqerpXRA3oZPrcv%2BAy3NJTApUBMawLriuC645LILZ2rwunzlqhSJoOT7NHA3T2xUq3Qy6EooGdK4Jll8AytL%2FSAYiQ5C3MBO9I9Gc%2FRZXGEyY4N8kF4pCIsoy2La26tJBsUBB75qGwQsMEM%2BN0JeD1DghGzN3lWmIPBGakAHwSuOy7w3Yu%2BwkCMD7TnzWY3IeG9GWyg8IFvAfcbsSx6f46GUwW%2BL0dDxhf6DlTiuzRtSzN79R6%2Fow1OUd%2Fuo26Ux3DTHMh%2FFJL4tvxH0xrKf1SYo9cPnzMUeo287NeGnj4bCL5Gspes4Y5uei9RSGCMwWUMlwzwL8u8AXpPq4yG3%2FYp6QbxdmY%2BF7pVtdm6YQJ7obLZc0vTTI1b4EL7Y%2FbpwpbPaky56GcpGv7A8VO4XZFTFmFMRnxMSckN%2FVI%2Brwvj71Tlxy6Ljyw9dl%2FKd8PS45Lx2NJU0mMsHFu7DemhKUcmPfMYwfEFx5CTJrOeJAfcsOTMDddix8iSo2n2w%2FzxjOQUnPzZOUFaSolF7Tva0WRprfXohW0ABrIT5g2z%2FWjac8NSsX2nzayzduJqtkUgMA7dpuyTOX0pN9fufjOirVBqkPvMb7P%2F3KdCL84C%2Bp5pawm0dQNAZ3Nmdzgmpk2gusXbmizzm8%2FBKeYkxxf9f0AODihycO%2FADzCtonMbhPxK5Uh1NMT72ENnOhNzNAr3KYjQcU4rWAhqaOvzzYUXwSQJvTJPp7SIxo4WtSq688mxZoWPy%2FZzDu1PukVCqPyTJVVOp9rKYcVQU%2BzbS9uyc%2FuYO3CSjUTHMP1T3CjZ%2Fotuf7L4r8WxsGvxkj8QIe5P%2FqzZj8JZ9OfptOyXOI9hm8J4hc5qyKwilauQxofeGnlPeJ9eFkiRY4xRBNPwUBaMgpRaZ6SSX%2BEbDrPgtG4GV5dCOSZj%2FKyTbFc60qU8qAGke2E4VTrKlCR%2F7J%2FQG7NLvakatXe9GVpvjFq9ieg9j6g0ppQ4y0OBa5UGOBc66llp3A51RhiSV6MzvoVc31TpjGssgd1AZ4T8a9fJv9A1%2FQpdazrWWDU6A31%2FTI2RRwcgB8tNNUbOPFY66lljZh1qjCDrXWPG1BitbpTBm004qm8mT462VhpgjKs0Qme70Zr3cWZ8rTHMGq3Z7ZP1mDoDZh3pjOzjDa4zeoc6Y7y6kQYiN1DGM7bnomXQXGeujE3axEFNRxq9RmcClHqjKk1F1uV8buOB5lJHfSuN0eVAUz%2F3%2BFaV5vaSAGad0mwQOXPUkQZ0pDSV2GhopQFdjjT2P05pbm%2BkMcW0R9U7o%2BIw4kBjl0XdlOevGuuMeaGjnnVGvKD7ll7mMt0ypv0VNIjo4fKbFU4Fu1t6oyWryopobQ7c0Ktvl8lucqrF88ODXJ6X7OC29Dyi9O9UkTT12KVpgWAaw20iULrL5C3fF1Fypz6Mnz7Eq%2BUHwhUhQxNfH9k33WNYFvtR3Pj4caKqPPyK%2FTAICVyGxkQtrzpid14pNiw9Ywu5HLG2wGha7TGwFF47xV1%2BbaRAyIlMNV2VEyTK%2B%2Be2v%2FoFo2nhyGsh95KFuX2ye3wVVVEmPD7Z1xfIncb70ckSb3x0X%2BPbZAblPHkXYxCzwrK3jw%2F5ez3XBh8%2F59%2F3kX2tzvL9O0ExadnvfJjSxUlUHkjJhMSixjgu1hgrrcxFUxLEeEMpjRL0vEbxGUkdKPAg9MKXwgE7GgckhRuQwwkplhfvWdWGH%2FLxriYpBrsD9dkz9cWuDoLkfgbOG4A3uKCFXNjRX01309UTwG2vnpDTo7WmZcgKb1Mhm%2BPD%2FjORZ70fKEdwrzhUM5v6CAPT9h6qdUGu8U7umw3NzCYlhufZvjhPVy1y78Ldb1ls0Uc6v1qixN196PsqXx%2BSXVv0TP4Ssa6VpMppmHa5gU9Z%2FNAuEoB1Z16Z%2BCwkN7ljEgQsd3mA8YfpdIWynfyUbEe2EgD9x1ObvedKvTXcrq5Pkd5oCDS1Zdf3bOwxVS%2Fc0SwAsqQZT91pGQHZmtTRwPXT4jkaTZ2Omo1oaGpE2lR6g%2BpGZVamXyyZ0kwKbbmUuO1kpA3UtzGYFDZaJYF4DKnkE11aYzVf31DlXJXlsiI2pwVP2JIVLfwWUPVbpKVPpRlL%2BZWjzrwYq9HKBAMjLC8K0gvChjYUxIrZuNEhztdfCFHSFcCVNVQrbzT8PMJ%2FmV%2F%2Fu9IT20%2FTw4PuOfrjt8dmazhVAVbBVo6KFK%2Bn86bm5JSJkFbSYLU85aBNVxL2%2BzqkK3Nnf9I1TW%2BTsTZ7XrY4e%2BY1v%2BA9xZfmqbXn3EyF264YvrDGmW6DnhhuOQ6MxXBjJmk8k8BDltQiXn1EInm6XLih4YDHOBnfmPxZUlKzsokAEeL9vjiVV17rj9SWQ8%2BrIDUSacycXnKlhHHrkc5iSraada9turkBubJJ7o%2FcloPeqyCXzTCq2E0EiRFf1iruYZy9tFBnG1LJz9P%2FqMHc99P%2FSwIe%2Fg8%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E)

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