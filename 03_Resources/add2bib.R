add2bib <- function(infile.bib,add.bib,outfile.bib=infile.bib) {
  
  # This function appends a BibTeX file specified in argument add.bib 
  # to another one as specified by infile.bib and saves the result
  # either in the original file (default) or in a new one as specified 
  # in outfile.bib
  
  IN  = readLines(infile.bib)
  ADD = readLines(add.bib)
  OUT = c(IN,ADD)
  writeLines(OUT,outfile.bib)
}