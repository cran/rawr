#' Retrieve raw R code from an .R file hosted on github website
#'
#'
#' @name github
#'
#' @usage github(url)
#'
#' @param url Link to an R file on github website
#'
#' @return A character vector of length 1 containing the R code from the target url. All code
#'    at the target url (including javascript, ruby, python) will be returned.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' github("https://github.com/hadley/vis-eda/blob/master/travel.R")
#'
#' # Same as above but provided to cat for easy viewing
#' github("https://github.com/hadley/vis-eda/blob/master/travel.R") %>%
#'   cat
#'
#'


github <- function(url) {

  if(substr(url, 1, 4) != "http") { stop("Invalid url - must start with https or http") }

  # Remove 'blob' from url
  url %>% strsplit(., "/") %>% unlist %>% .[-6] %>% paste0(., collapse="/") %>%

  # replace domain and read
    sub("github.com", "raw.githubusercontent.com", .) %>%
    read_html %>% html_text

}



