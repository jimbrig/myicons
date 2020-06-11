
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
  attachment,
  chameleon,
  pkgdown,
  knitr,
  rmarkdown
)

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


