box::use(
  haven[as_factor],
  dplyr[`%>%`, select, filter, mutate],
  tibble[as_tibble],
  here[here]
)

box::use(tibble[as_tibble])


#' @export
ess1 <- function(raw = FALSE) {
  zipfolder <- here("data", "ESS1e06_6.spss.zip")
  filename <- "ESS1e06_6.sav"
  dir <- tempdir()

  sav_file <- utils::unzip(zipfile = zipfolder, files = filename, exdir = dir)
  df <- haven::read_sav(sav_file)

  ignore_cols <- c("name", "essround", "edition", "proddate")
  df <- df[, !names(df) %in% ignore_cols]

  df <- tibble::as_tibble(df)
  return(df)
}

#' @export
ess2 <- function() {
  path <- "data/ESS2e03_6.spss.zip"

  dir <- tempdir()
  tempfile <- utils::unzip(path, files = "ESS2e03_6.sav", exdir = dir)
  data <- haven::read_sav(tempfile)

  ignore_cols <- c("name", "essround", "edition", "proddate")
  data <- data[, !names(data) %in% ignore_cols]

  return(data)
}

#' @export
ess9 <- function() {
  path <- "data/ESS9e03_1.spss.zip"

  dir <- tempdir()
  tempfile <- utils::unzip(path, files = "ESS9e03_1.sav", exdir = dir)
  data <- haven::read_sav(tempfile)

  ignore_cols <- c("name", "essround", "edition", "proddate")
  data <- data[, !names(data) %in% ignore_cols]

  return(data)
}
