# ACTIVATE R-MARKDOWN COURSE --------------------------------------------------

# To activate the R environment this project was written in and have everything 
# working properly, edit the path below to match the directory you cloned the 
# R-Markdown repository in

# change to project directory
setwd("/Users/alex/Documents/GitHub/R-Markdown")

# activate project
renv::activate(getwd())

# restore environment (may require package downloads)
renv::restore()

# In case, something went wrong, you may manually setup your system via the 
# following commands (the last two lines refer to the papaja package we will 
# make use later on in the course):

# install.packages("base64enc")   # Tools for base64 encoding
# install.packages("bitops")      # Bitwise Operations
# install.packages("caTools")     # Moving Window Statistics, GIF, ROC AUC, etc.
# install.packages("devtools")    # Tools to Make Developing R Packages Easier    
# install.packages("highr")       # Syntax Highlighting for R Source Code
# install.packages("htmltools")   # Tools for HTML
# install.packages("jsonlite")    # JSON Parser and Generator for R
# install.packages("knitr")       # Package for Dynamic Report Generation in R
# install.packages("markdown")    # Render Markdown with the C Library 'Sundown'
# install.packages("psych")       # Procedures for Psychological Research
# install.packages("rmarkdown")   # Dynamic Documents for R
# install.packages("robustbase")  # Basic Robust Statistics
# install.packages("shape")       # Functions for Plotting Shapes & Colors
# install.packages("tinytex")     # Install/Maintain TeXLive and Compile LaTeX 
# install.packages("yaml")        # Methods to Convert R Data to YAML and Back  
# devtools::install_github("crsh/papaja")        
# devtools::install_github("crsh/papaja@devel")


# Regardless whether everything worked fine using renv or you had to setup your 
# system manually, the following may need to be executed as well, if you haven't 
# installed LaTeX on your system or despite having done so get an error message:
tinytex::install_tinytex()
