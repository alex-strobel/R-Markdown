# ACTIVATE R-MARKDOWN COURSE --------------------------------------------------

# 1) Activate R environment via the renv package (default option) -------------

# Code partly taken from Philippe Jawinski, https://github.com/pjawinski

# To activate the R environment this project was written in and have everything 
# working properly, edit the path below to match the directory you cloned the 
# R-Markdown repository in

# Change to project directory via here package
library (here) 
# set top level directory to source file
here::i_am("flag_project_root_RMDcourse.txt")

# Detach other packages if there are any to avoid conflicts with packages of 
# the R environment of this project
if (!is.null(names(sessionInfo()$otherPkgs))) {
  invisible(lapply(paste('package:',names(sessionInfo()$otherPkgs), sep = ""), detach, character.only = TRUE, unload = TRUE))
}

# Activate project
source('renv/activate.R')
renv::activate(getwd())
# Don't ask why whether sourcing the activate function is really necessary.
# In some cases, in can help, in other cases it will be unnecessary, but
# in any case, it will do no harm.

# Restore environment (may require package downloads)
renv::restore()

# Please note that it may be the case that you get an error message if this 
# project's R environment later want to load packages in versions that differ 
# from you system's package versions. If so, it may help to restart R before
# activating the project, i.e., before executing the commands above, execute:
#
# if (exists('.rs.restartR', mode = 'function')) { .rs.restartR() }
#
# Yet, this may cause another problem: R does not (seem to) restart but to 
# freeze. In this case simply close RStudio and reopen it. Now, everything
# should work. If not ...


# 2) Setup R environment manually (fallback option) ---------------------------

# In case, something went wrong when trying to use option 1), you may need to 
# manually setup your system via the following commands (the last two lines 
# refer to the papaja package we will make use later in the course):

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


# 3) Install or reinstall LaTeX (mandatory if LaTeX is not installed) ---------

# Regardless whether everything worked fine using renv or you had to setup your 
# system manually, the following may need to be executed as well, if you haven't 
# installed LaTeX on your system or despite having done so get an error message:
tinytex::install_tinytex()
