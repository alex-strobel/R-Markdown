editbib <- function(infile,outfile=NULL,add.special=NULL,add.replace=NULL) {

  # function for replacing special characters (ä, ñ, ß etc.) 
  rsc <- function(string) {
    special=c("ä","ö","ü","Ä","Ö","Ü","ñ","á","à","é","è","ê","ó","ò","ú","ù","ß",add.special)
    replace=c('{\\"a}','{\\"o}','{\\"u}','{\"A}','{\"O}','{\"U}','{\\~n}','{\\´a}','{\`a}','{\\´e}','{\`e}','{\\^e}','{\\´o}','{\`o}','{\\´u}','{\`u}','{\\ss}',add.replace)
    new.string=string
    for (i in 1:length(special)) {
      new.string=sub(pattern=special[i],replacement = replace[i],x=new.string,fixed=T)
    }
    return(new.string)
  }
  txt=readLines(infile)

  entries=NULL
  for (i in 1:length(txt)) {
    if (substr(txt[i],1,1)=="@") {
      ref=unlist(strsplit(txt[i],"{",fixed=T))
      entry=NULL
      for (j in (i+1):(i+10)) {
        if (length(grep("author",txt[j]))>0) {
          author=unlist(strsplit(substr(txt[j],14,33),",",fixed=T))[1]
        }
        author=sub(pattern=" ",replacement="",author)
        
        if (length(grep("year",txt[j]))>0) {
          year=substr(txt[j],12,15)
        }
        entry=c(entry,rsc(txt[j]))
        if (txt[j]=="}") {
          break
        }
      }
      newref=paste(ref[1],"{",author,year,",",sep="")
      entries=c(entries,newref,entry)
    }
  }
  lines.entries=grep('@',entries)[-1]
  entries[lines.entries-1]=paste0(entries[lines.entries-1],'\n}')
  entries=c(entries,'\n}')
  out=file(description=outfile,open="wt")
  writeLines(entries, out)
  close(out)
}