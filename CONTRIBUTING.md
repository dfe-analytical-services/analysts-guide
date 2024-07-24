# Contributing to the Analyst's Guide

Thank you for investing your time in contributing to the analyst's guide! All contributions are very welcome - we want this to be a useful resource for the whole analytical community in DfE :sparkles:.

Read our [Code of Conduct](./CODE_OF_CONDUCT.md) to keep our community approachable and respectable.

The main branch of the site is protected and can only be updated via pull requests. All pull requests must be approved by a repository admin before merging.

In this guide you will get an overview of the contribution workflow from opening an issue, creating a PR, reviewing, and merging the PR.

## New contributor guide

To get an overview of the project, read the [README](README.md). Here are some resources to help you get started with open source contributions:

-   [Finding ways to contribute to open source on GitHub](https://docs.github.com/en/get-started/exploring-projects-on-github/finding-ways-to-contribute-to-open-source-on-github)
-   [Set up Git](https://docs.github.com/en/get-started/quickstart/set-up-git)
-   [GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow)
-   [Collaborating with pull requests](https://docs.github.com/en/github/collaborating-with-pull-requests)

### Quarto guidance

For more information specific to how a quarto site works, and for examples of what is possible within a static quarto site, see the main [Quarto website](https://quarto.org/).

Hadley Wickham's book, [R for Data Science](https://r4ds.had.co.nz/introduction.html), gives the following intro to Quarto: 

> `"Quarto is an open-source scientific and technical publishing system. It allows you to create dynamic documents that weave together narrative text, code, and output, such as plots and tables."`

#### Visual Editor

The Visual Editor in RStudio offers a WYSIWYM (What You See Is What You Mean) interface for creating Quarto documents. These documents, saved as .qmd files, are written using Markdown—a lightweight syntax for formatting plain text. Specifically, Quarto employs Pandoc Markdown, an enhanced version of Markdown, which supports a variety of elements such as tables, citations, cross-references, footnotes, divs/spans, definition lists, attributes, raw HTML/TeX, and more. Additionally, Quarto allows for the execution of code cells with inline output display. Although Markdown is designed to be straightforward, it still necessitates learning some new syntax.

For those who are new to computational documents like .qmd files but have experience with tools like Google Docs or MS Word, the visual editor in RStudio is the most user-friendly way to begin working with Quarto. In the visual editor, you can use the toolbar buttons to insert images, tables, cross-references, and other elements. 

#### Adding images (in the right folder, code to do so)

The visual editor also simplifies inserting images and customizing their display. You can paste an image directly from your clipboard into the visual editor, which will save a copy of the image in your project directory and link to it. Alternatively, you can use the Insert > Figure / Image menu to browse for the image you want to insert or paste its URL. This menu also allows you to resize the image, add captions, alternative text, and links.

The visual editor offers many additional features that become evident as you gain more experience with it.

Most importantly, while the visual editor displays your content with formatting, it saves everything in plain Markdown. You can easily switch between the visual and source editors to view and edit your content in either format.

#### Adding links (within page, within site, external to site)\]

In Quarto, you can add links using the following Markdown syntax:

 1. Inline Links:
    [Link Text] ``(https://example.com)``

 2. Reference Links:
    [Link Text][1]

   `` [1]: https://example.com``
    
In Quarto, you can also include links within various contexts, such as code blocks or embedded within other content structures, depending on the complexity of your document. However, the basic Markdown link syntax will generally cover most use cases.
 
 ![Example for adding links](images/adding_links_example.png){width=300}
 
#### Adding videos / other content
##### **Adding Videos**
You can embed videos in Quarto documents using HTML, Markdown, or specialised Quarto syntax. Here are some methods:

1. Using a shortcode:
``` {.markdown shortcodes="false"} 
{{< video url >}}
``` 
  - For example, here we embed a YouTube video:
 
``` {.markdown shortcodes="false"} 
{{< video https://www.youtube.com/embed/wo9vZccmqwc >}} 
``` 
{{< video https://www.youtube.com/embed/wo9vZccmqwc >}} 

2. Embedding videos in other formats:
  - In HTML formats the video will be embedded within the document.
  - For other formats, a simple link to the video will be rendered.

##### **Adding Other Content**
 - **Audio Files**:
 You can embed audio files using the HTML <audio> tag.
 - **Interactive Content with HTML Widgets**:
 Quarto supports various HTML widgets that can add interactive content to your document. 

##### Tips 
- **Relative Paths**:
Use relative paths for local files to ensure your document remains portable. 

In R, relative paths refer to file or directory paths specified in relation to the current working directory. Relative paths help manage current working files.

If you're struggling with running your files across different paths in your working directories, then the [here](https://here.r-lib.org/) package can sometimes help you solve those types of issues.

- **Test Across Browsers**: Ensure multimedia content works across different browsers and devices. 

- **Output Formats**: Verify that multimedia elements render correctly in the intended output formats (HTML, PDF, etc.). 

By following these methods, you can effectively add videos, images, audio, and interactive content to your Quarto documents, enhancing their informativeness and engagement.


#### Redirecting pages where changing / removing

Redirecting pages in a Quarto project for R involves creating ``a _quart.yml`` configuration file where you can define redirects.

1. **``Create/Edit_quarto.yml``** :
Ensure you have a ``_quarto.yml`` file in your Quarto project.

2. **``Add redirects``**:
In ``_quarto.yml``, define redirects like this:
                                    - From: ``old-page.html``
                                    to:     ``new-page.html``
                                  
3. **``Render Project``** :
Run ``quarto render`` in your project directory to apply changes.

4.**``Verify``**:
Test old URLs to ensure they redirect correctly.

This sets up URL redirects for pages that have changed or been removed in your Quarto project.

#### Checking for broken links when changing headings

When changing headings in Quarto project, it's crucial to ensure that all links referencing these headings are still correct. Here's a quick guide to check for broken links:

1. **Change Headings**: Update your headings in the relevant ``.qmd files``.

2. **Run Quarto's Built-in Link Checker**: Quarto has a built in feauture to check for broken links. 

Run the following command in your project directory: 

```quarto check ```

This command will scan your project for broken links and report any issues. 

3. **Manually Update Links**: If any broken links are reported, update them to match the new headings. Use the correct anchors, which typically follow the format `#new-heading-text`. 

4. **Re-render Project**: After updating links, re-render your project: ```quarto render ``` 

5. **Double-Check**: Manually verify a few pages to ensure that the links work as expected. 

### Example 

If you changed a heading from `## Old Heading` to `## New Heading`, make sure all links like 
`[link text](#old-heading)` are updated to `[link text](#new-heading)`. 
By following these steps, you can efficiently check for and fix broken links when changing headings in your Quarto project.

#### Building locally before raising a pull request

Here's a streamlined guide for building your Quarto project locally before raising a pull request (from the terminal): 

1. **Pull Latest Changes**: Make sure your local branch is up-to-date with the main branch. 
                        ```git pull origin main ``` 

2. **Make Your Changes**: Edit your `.qmd` files or other relevant files in the project. 

3. **Build the Project Locally**: Render the entire project to catch any errors. 
                          ```quarto render ``` 
                          
###### Note: While this guide presents a terminal-based workflow, there are equivalent commands available in the R console for those who prefer working within R. For example, you can use ```quarto_preview()``` in the R console to preview your Quarto project.

4. **Check for Errors and Warnings**: Review the console output and fix any issues. 

5. **Preview the Project**: Open the generated files in a browser to ensure everything looks correct. 
                          ```quarto preview ``` 

6. **Check for Broken Links**: Use Quarto’s link checker to find and fix broken links. 
                           ```quarto check ```

7. **Commit Your Changes**: Add and commit your changes to your local repository. 
              ```git add . git commit -m "Describe your changes" ``` 

8. **Push Your Changes**: Push your changes to your feature branch. 
                    ```git push origin your-feature-branch ``` 

9. **Create a Pull Request**: Go to your repository platform (e.g., GitHub) and create a pull request from your feature branch to the main branch. 


Following these steps ensures your changes are correctly implemented and verified locally, minimising potential issues during the review process.


#### Changing the appearance of code blocks

You can modify the `highlight-style` element in the `quarto.yml` file to change the display of code blocks using predefined themes. This will change the appearance of all code snippets across the entire Analysts' guide. The current theme is set to "printing" but there is a list of other available themes [on the Quarto website](https://quarto.org/docs/output-formats/html-code.html#highlighting).

Some things to be aware of before you make changes:

-   Some of the themes are adaptive, meaning that if you change the site view from dark mode to light mode then the theme will also change accordingly.

-   The appearance of code snippets will only change if the language (e.g. R, Python) is defined at the start of the snippet (e.g. ```` ``` {r connection_example, eval=FALSE} ````). Including `eval=FALSE` stops your code snippet from actually running. If no language is defined, the snippet appearance will need to be modified manually and this can cause some issues.

### Adding images from draw.io

You can create images, flowcharts, and diagrams using [draw.io](http://draw.io). To add them to the Analysts' guide, we recommend embedding them, by selecting File > Embed > HTML. The image below shows the options that you should select when embedding a diagram

![](../images/embed-drawio.png)

### Issues

#### Create a new issue

If you spot a problem with the site, [search if an issue already exists](https://docs.github.com/en/github/searching-for-information-on-github/searching-on-github/searching-issues-and-pull-requests#search-by-the-title-body-or-comments). If a related issue doesn't exist, you can open a new issue using a relevant [issue form](https://github.com/dfe-analytical-services/analysts-guide/issues/new/choose).

#### Solve an issue

Scan through our [existing issues](https://github.com/dfe-analytical-services/analysts-guide/issues) to find one that interests you. If you find an issue to work on, you are welcome to open a PR with a fix.

### Make Changes

Key things to remember when making or proposing changes:

-   Where guidance already exists elsewhere it should be linked to rather than duplicated

-   When adding images, save them in the /images folder

-   When adding files for download, save them in the /resources folder - Don't commit rendered .html files for pages

-   If your changes remove or edit a pre-existing anchor link, consider how that will be redirected for users who may have bookmarked it

#### Make changes in the UI

Click **Edit this page** at the bottom of the right hand table of contents of any page to make small changes such as a typo, sentence fix, or a broken link. This takes you to the `.Qmd` file where you can make your changes and [create a pull request](#pull-request) for a review.

#### Make changes locally

1.  Clone or fork the repository.

2.  Open the repository in your editor of choice, e.g. R Studio.

3.  Create a working branch and start with your changes!

4.  Commit and push the changes to your working branch.

### Pull Request 

All pull requests should be made against the main branch.

When you're finished with the changes, create a pull request, also known as a PR.

-   Don't forget to [link PR to issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue) if you are solving one.

Once you submit your PR, a repository admin will review your proposal. We may ask questions or request additional information.

-   We may ask for changes to be made before a PR can be merged, either using [suggested changes](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/incorporating-feedback-in-your-pull-request) or pull request comments. You can apply suggested changes directly through the UI. You can make any other changes and then commit them to your branch.

-   As you update your PR and apply changes, mark each conversation as [resolved](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/commenting-on-a-pull-request#resolving-conversations).

-   If you run into any merge issues, checkout this [Git tutorial](https://github.com/skills/resolve-merge-conflicts) to help you resolve merge conflicts and other issues.

## Support

If you need any assistance at all, please contact [statistics.development\@education.gov.uk](mailto:statistics.development@education.gov.uk).
