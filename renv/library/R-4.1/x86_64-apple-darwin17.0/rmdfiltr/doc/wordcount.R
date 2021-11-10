## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE---------------------------------------------------
library("tibble")
library("dplyr")
library("ggplot2")

## ----single-filter-display, eval = FALSE--------------------------------------
#  library("rmdfiltr")
#  add_citeproc_filter(args = NULL)

## ----single-filter, echo = FALSE----------------------------------------------
library("rmdfiltr")
add_citeproc_filter(args = NULL, error = FALSE)

## ----nested-filters-display, eval = FALSE-------------------------------------
#  add_wordcount_filter(add_citeproc_filter(args = NULL))

## ----nested-filters, echo = FALSE---------------------------------------------
add_wordcount_filter(add_citeproc_filter(args = NULL, error = FALSE), error = FALSE)

## ----word-counts, warning = FALSE, fig.dim = c(6, 3.5), fig.align = "center", echo = FALSE----
tribble(
  ~method, ~text, ~part, ~word_count,
  "rmdfiltr", "Simple", "Body", 10830,
  "rmdfiltr", "Simple", "References", 2321,
  "rmdfiltr", "Complex", "Body", 1749,
  "rmdfiltr", "Complex", "References", 322,
  
  "wordcountaddin", "Simple", "Body", 10761,
  "wordcountaddin", "Simple", "References", NA,
  "wordcountaddin", "Complex", "Body", 1407,
  "wordcountaddin", "Complex", "References", NA,
  
  "texcount", "Simple", "Body", 10448 + 95,
  "texcount", "Simple", "References", 2881,
  "texcount", "Complex", "Body", 944 + 31,
  "texcount", "Complex", "References", 400,
  
  "Word", "Simple", "Body", 10882,
  "Word", "Simple", "References", 2407,
  "Word", "Complex", "Body", 1712,
  "Word", "Complex", "References", 329,
  
  "Pages", "Simple", "Body", 10812,
  "Pages", "Simple", "References", 2777,
  "Pages", "Complex", "Body", 1709,
  "Pages", "Complex", "References", 429,
  
  "wordcounter.net", "Simple", "Body", 10605,
  "wordcounter.net", "Simple", "References", 2333,
  "wordcounter.net", "Complex", "Body", 1713,
  "wordcounter.net", "Complex", "References", 324
) %>%
  group_by(text, part) %>% 
  mutate(rel_word_count = word_count / max(word_count, na.rm = TRUE) * 100) %>%
  ggplot(aes(x = method, y = rel_word_count, fill = method)) +
    geom_bar(stat = "identity") +
    geom_text(aes(label = round(rel_word_count), color = method), nudge_y = -12) +
    geom_text(aes(label = prettyNum(word_count, big.mark = ","), color = method), nudge_y = -28 , size = 2.2) +
    scale_fill_viridis_d() +
    scale_color_manual(values = rep(c("white", "black"), each = 3)) +
    facet_grid(part ~ text) +
    labs(x = "Method", y = "Relative word count") +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1)
      , legend.position = "none"
    )

