
#  ------------------------------------------------------------------------
#
# Title : "myicons" R Package Development History Script
#    By : Jimmy Briggs <jimmy.briggs@oliverwyman.com>
#  Date : 2020-06-11
#
#  ------------------------------------------------------------------------


# setup -------------------------------------------------------------------
require(pacman)
pacman::p_load(
  usethis,
  devtools,
  desc,
  pkgbuild,
  pkgload,
  pkgdown,
  knitr,
  rmarkdown,
)

remotes::install_github("ThinkR-open/testdown")
remotes::install_github("ThinkR-open/attachment")
remotes::install_github("ThinkR-open/chameleon")

# initialize package ------------------------------------------------------
usethis::create_package(
  "myicons",
  fields = list(
    Package = "myicons",
    Title = "myicons",
    Description = "Manage your own personal icon library and generate random
    icons for quick prototyping.")
)

# ignore this script
usethis::use_build_ignore("pkgdevt.R")

# setup git and github
usethis::use_git()
usethis::use_github(private = TRUE)
# run `git push --set-upstream origin master` in gitbash

# vaccinate
usethis::git_vaccinate()

# git sitrep
usethis::git_sitrep()

# check build tools
pkgbuild::check_build_tools()
devtools::dev_sitrep()

# update devt packages
rstudioapi::restartSession()
devtools::update_packages("devtools")
devtools::install_dev_deps()

# check again
devtools::dev_sitrep()

# setup namespace and roxygen
usethis::use_namespace()
usethis::use_roxygen_md()
devtools::document()

# package R documentation and basic imports
usethis::use_package_doc()
usethis::use_tibble() # #' @return a [tibble][tibble::tibble-package]
usethis::use_pipe() # move to package.R
# usethis::use_tidy_eval() # move to package.R

# document
devtools::document()

# README ------------------------------------------------------------------
usethis::use_readme_rmd(open = FALSE)

# logo/hex sticker
usethis::use_logo("man/figures/hex-logo.png")

# badges
usethis::use_lifecycle_badge("experimental")
usethis::use_badge(
  "Project Status: WIP",
  href = "http://www.repostatus.org/#wip",
  src = "https://www.repostatus.org/badges/latest/wip.svg"
)
knitr::knit("README.Rmd")

# DESCRIPTION -------------------------------------------------------------



# directories -------------------------------------------------------------
fs::dir_create("inst/lib", recurse = TRUE)


# functions ---------------------------------------------------------------
usethis::use_r("icon_text")
usethis::use_r("random_icon")
usethis::use_r("icon_library")

# data --------------------------------------------------------------------
usethis::use_data_raw("icon_table")

# tests -------------------------------------------------------------------
usethis::use_testthat()
usethis::use_test("random_icon")
usethis::use_test("icon_text")

# vignettes ---------------------------------------------------------------
# vignettes ---------------------------------------------------------------


# shiny-app ---------------------------------------------------------------
usethis::use_addin()



# CI + extensions ---------------------------------------------------------
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()



# build -------------------------------------------------------------------
usethis::use_package("htmltools")
attachment::att_amend_desc(extra.suggests = c("covr", "pkgdown", "usethis", "devtools", "testthat"))



