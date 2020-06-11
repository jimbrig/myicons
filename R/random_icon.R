#' Random Icon Generator
#'
#' This function generates a random `fontawesome` icon for quick usage
#' while prototyping shiny apps.
#'
#' @param term (optional) term to limit number of icons available to a specific
#'   category. For a list of available terms see the [icon_table].
#'
#' @return An HTML icon element returned via [shiny::icon()]
#' @export
#'
#' @importFrom dplyr filter
#' @importFrom shiny icon
#' @importFrom rlang .data
#' @importFrom stats runif
#' @inheritParams shiny::icon
#'
#' @examples
#' require(shiny)
#' random_icon() # should display in R Viewer
#' random_icon("animal")
#' shiny::fluidRow(random_icon())
random_icon <- function(term = NULL,
                        class = NULL) {

  icon_tbl <- icon_table # fontawesome:::fa_tbl

  if (!is.null(term)) {
    filt <- icon_tbl %>%
      dplyr::filter(grepl(term, .data$terms))
    if (nrow(filt) == 0) {
      warning(term, " not found. Reverting to full library of icons.")
      icon_tbl <- icon_tbl
    } else if (nrow(filt) > 0) {
      icon_tbl <- filt
    } else {
      icon_tbl <- icon_table
    }

  }

  row <- stats::runif(n = 1, min = 1, max = nrow(icon_tbl) + 1) %>% trunc()
  
  out <- icon_tbl[row, "name"]
  message("Random Icon Selected: ", out)
  shiny::icon(out, class = class)

}
