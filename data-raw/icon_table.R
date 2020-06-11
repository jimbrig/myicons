## code to prepare `icon_table` dataset goes here

library(jsonlite)
library(fontawesome)
library(rlang)
library(purrr)
library(knitr)
library(docthis)
library(tidyverse)

url <- "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/metadata/icons.json"

fa_list <- jsonlite::fromJSON(url)

icon_table <- fontawesome:::fa_tbl %>%
  dplyr::mutate(
    terms = (
      purrr::map_chr(
        .$name,
        function(name) {
          hold <- fa_list[[name]][["search"]][["terms"]]
          if (length(hold) == 0) return(NA_character_)
          knitr::combine_words(hold)
        })
    ),
    terms = dplyr::coalesce(terms, "Unknown")
  )

usethis::use_data(icon_table, overwrite = TRUE, version = 3)
usethis::use_data(icon_table, internal = TRUE, version = 3)

tools::resaveRdaFiles("data", version = 3)
tools::resaveRdaFiles("R", version = 3)
tools::checkRdaFiles("data")
tools::checkRdaFiles("R")

txt <- docthis::doc_this("icon_table")
cat(txt, file = "R/icon_table.R", sep = "\n")
