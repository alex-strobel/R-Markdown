# ACTIVATE R-MARKDOWN COURSE --------------------------------------------------

# It is assumed that you have just cloned the R-Markdown repository from GitHub 
# into some directory using this command on, e.g., the RStudio console 

# git clone https://github.com/alex-strobel/R-Markdown.git

# If so, then execute the code below. If you are not sure whether you are in the 
# directory where you cloned the R-Markdown repository to, type 
# getwd() 
# and if you are not in the correct directory, type 
# setwd("[full path to parent directory of the R-Markdown clone]")

# Now it's time to activate the R environment this project was written in and
# have everything working properly

# change to project directory
setwd(paste0(getwd(), "/R-Markdown"))

# activate project
renv::activate(getwd())

# restore environment (may require package downloads)
renv::restore()


