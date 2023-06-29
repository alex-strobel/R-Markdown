# R-Markdown

[Alexander Strobel](mailto:alexander.strobel@tu-dresden.de) and [Christoph Scheffel](mailto:christoph_scheffel@tu-dresden.de)<br>
Faculty of Psychology<br>
TU Dresden

Welcome to our introductory R Markdown course!
R Markdown is a simple and easy to learn formatting syntax for authoring HTML, PDF, and MS Word documents.
R Markdown allows to create updatable and reproducible reports because one analyzes data and reports the results in one instance and in a dynamic manner.
In principle, having a handful of data from a pilot study, you can write the Introduction and Methods section of a scientifc manuscript in R Markdown language (with a little help from LaTeX), all analysis routines in R code, and by placing references to objects generated by this code (such as, e.g., a linear model) in the text body of the Results section, you can even write up the whole Results section without even having started to collect the actual data.
Once data collection (and possible preprocessing outside of R) is finished, your report will be ready in an instance, and all that remains to be done is the Discussion.

In this course, you will learn how to use R Markdown for that purpose.
We provide you with a number of lessons, each ending with some exercises. You should try to come up with solutions to the exercises before sneaking into the solutions that we also provide.
We have also tried to make this course as accessible as possible by providing it using the `renv` package. 
`renv` is short for *R environment*. 
This means that (ideally) this course does not require you to first download a number of packages required for data analysis and document formatting and generation. 
It comes with the R environment needed to start right away (or after a few minutes, depending what is already present on your system).  

## Folder structure

[01_Lessons/](01_Lessons/)           - so far three lessons to familiarize you with R Markdown and LaTeX<br>
[02_Solutions/](02_Solutions/)       - solutions to the exercises at the end of each lesson<br>
[03_Resources/](03_Resources/)       - further resources (so far not fully functional)<br>
[renv/](renv/)                       - contains a file to initiate the R environment of this course<br>
[activateCourse.R](activateCourse.R) - R script for activating the course via `renv` or via manual setup<br>
[flag_project_root_RMDcourse.txt](flag_project_root_RMDcourse.txt) - used to automatically set working directory<br>  
[R-Markdown.Rproj](R-Markdown.Rproj) - can be ignored or used for bundling together all activity in this project<br>
[README.md](README.md)               - this document<br>
[renv.lock](renv.lock)               - a list of R packages automatically downloaded and attached to the course's environment

## How to use this repository

In order to take this course, first navigate to the folder where you want the course to be stored and R Markdown files to be executed.
Then clone this repository from the RStudio console via the following command:

`git clone https://github.com/alex-strobel/R-Markdown.git` (Mac OS/Linux)<br>
`gert::git_clone https://github.com/alex-strobel/R-Markdown.git`(Windows)

The above commands will only work if you have `git` installed on your system.
If not, simply download this repository via clicking on the green `Code` button at the top of this page and select **Download ZIP**.
In any case, open activateCourse.R in RStudio and follow the instructions (please note that to setup your environment may take a few minutes).
Then open 01_Lessons/RM_01_GettingStarted.Rmd for ... ahm ... getting started!

## Required software

To use R Markdown, you need to have installed the following software (the links take you to the respective download sites)

- [The R Project for Statistical Computing](https://www.r-project.org)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) 

The R Project provides an _Introduction to R_, but it is not a short read. For a denser overview on the basics of R, you may want to use the cheat sheet below:

- [Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)
- [Base R Cheat Sheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)

So far, we could not find a both useful *and* visually appealing introduction, just ask the internet if you do not find RStudio's GUI self-explaining.

## Helpful guides

While we tried our best to provide you with our knowledge on R Markdown, we consider us still as novices ourselves.
So, it may pay to read the R Markdown Guide, and often enough, you may want to refer to the R Markdown Cheat Sheet:

- [R Markdown Guide](https://bookdown.org/yihui/bookdown/)
- [R Markdown Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)

Because later on in this course, we will also use the R package *papaja* dedicated to use R Markdown for writing psychological articles in APA style (so far only available for its 6th edition), one needs to install it as described on the author's GitHub site.
It may also pay to familiarize yourself with the manual.

- [*papaja* Download](https://github.com/crsh/papaja)
- [*papaja* Manual](http://frederikaust.com/papaja_man/)
