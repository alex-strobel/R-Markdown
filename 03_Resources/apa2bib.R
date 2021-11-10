apa2bib <- function(reference,write2file=F,filename="reference.bib") {
  
  ref = reference
  # find year (and issue number if one exists) 
  openbrace  = unlist(gregexpr(pattern="[(]",ref))
  closebrace = unlist(gregexpr(pattern="[)]",ref))
  # separate authors from rest
  authors = substr(ref,1,openbrace[1]-2)
  # split author names and initials
  authors = unlist(strsplit(authors,"[,]"))
  # remove unnecessary spaces and ampersand 
  for (i in 1:length(authors)) {
    if (substr(authors[i],1,1)==" ") { 
      authors[i]=substr(authors[i],2,nchar(authors[i])) 
      authors[i]=sub("& ","",authors[i])
    }
  }
  # collapse authors with "and", their initials appearing before the name 
  author=NULL
  for (i in seq(1,length(authors),by=2)) {
    if (i == length(authors)-1) {
      author=paste0(author,paste(authors[i+1],authors[i],collapse=""))
    } else {
      author=paste0(author,paste(authors[i+1],authors[i],"and "),collapse="")
    }
  }
  # get year
  year = as.numeric(substr(ref,openbrace[1]+1,closebrace[1]-1))
  # get issue number
  if (length(openbrace)>1) {
    number = as.numeric(substr(ref,openbrace[2]+1,closebrace[2]-1))
  } else {
    number=""
  }
  # reference without author and year
  ref1=substr(ref,closebrace[1]+2,nchar(ref))
  # get DOI
  doi=substr(ref1,unlist(gregexpr(pattern="doi:",ref1))+4,nchar(ref1))
  # reference without DOI
  ref2=substr(ref1,1,unlist(gregexpr(pattern="doi:",ref1))-2)
  # get title and remove initial space
  title=unlist(strsplit(ref2,'[.]'))[1]
  if (substr(title,1,1)==" ") { title=substr(title,2,nchar(title)) }
  # get journal name, volume, and pages
  jvip=unlist(strsplit(ref2,'[.]'))[2]
  journal=unlist(strsplit(jvip,'[,]'))[1]
  if (substr(journal,1,1)==" ") { journal=substr(journal,2,nchar(journal)) }
  volume=unlist(strsplit(jvip,'[,]'))[2]
  volume=as.numeric(unlist(strsplit(volume,'[()]'))[1])
  pages=sub(" ","",unlist(strsplit(jvip,'[,]'))[3])
  # replace special dashes (e.g.,—) by simple one (-)  
  substr(pages,which(utf8ToInt(pages)>57),which(utf8ToInt(pages)>57))="-"
  
  # return BibTeX entry on console
  cat("",fill=T)
  cat(paste0("@article{",authors[1],year,","),fill=T)
  cat(paste0("   author={",author,"},"),fill=T)
  cat(paste0("   title={",title,"},"),fill=T)
  cat(paste0("   journal={",journal,"},"),fill=T)
  cat(paste0("   year={",year,"},"),fill=T)
  cat(paste0("   volume={",volume,"},"),fill=T)
  cat(paste0("   number={",number,"},"),fill=T)
  cat(paste0("   pages={",pages,"},"),fill=T)
  cat(paste0("   doi={",doi,"}"),fill=T)
  cat(paste0("}"),fill=T)
  cat("",fill=T)
  
  # write BibTeX entry to file if requested
  if (write2file==T) {
    out=file(filename, "w")
    writeLines(paste0("@article{",authors[1],year,","),out,sep="\n")
    writeLines(paste0("   author={",author,"},"),out,sep="\n")
    writeLines(paste0("   title={",title,"},"),out,sep="\n")
    writeLines(paste0("   journal={",journal,"},"),out,sep="\n")
    writeLines(paste0("   year={",year,"},"),out,sep="\n")
    writeLines(paste0("   volume={",volume,"},"),out,sep="\n")
    writeLines(paste0("   number={",number,"},"),out,sep="\n")
    writeLines(paste0("   pages={",pages,"},"),out,sep="\n")
    writeLines(paste0("   doi={",doi,"}"),out,sep="\n")
    writeLines(paste0("}"),out,sep="\n")
    close(out)
  }
}

