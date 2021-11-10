## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library("rmdfiltr")

## ----single-filter-display, eval = FALSE--------------------------------------
#  library("rmdfiltr")
#  add_citeproc_filter(args = NULL)

## ----single-filter, echo = FALSE----------------------------------------------
library("rmdfiltr")
add_citeproc_filter(args = NULL, error = FALSE)

## ----nested-filters-display, eval = FALSE-------------------------------------
#  add_replace_ampersands_filter(add_citeproc_filter(args = NULL))

## ----nested-filters, echo = FALSE---------------------------------------------
add_replace_ampersands_filter(add_citeproc_filter(args = NULL, error = FALSE), error = FALSE)

