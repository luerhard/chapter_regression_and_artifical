box::use(haven)

#' @export
ess9 <- function() {
  path <- "data/ESS9e03_1.spss.zip"

  dir <- tempdir()
  tempfile <- utils::unzip(path, files = "ESS9e03_1.sav", exdir = dir)
  data <- haven::read_sav(tempfile)

  ignore_cols <- c("name", "essround", "edition", "proddate")
  data <- data[, !names(data) %in% ignore_cols]
  unlink(dir, recursive = TRUE)

  return(data)
}

#' @export
ess1 <- function() {
  path <- "data/ESS1e06_6.spss.zip"
  
  dir <- tempdir()
  tempfile <- utils::unzip(path, files = "ESS1e06_6.sav", exdir = dir)
  data <- haven::read_sav(tempfile)
  
  ignore_cols <- c("name", "essround", "edition", "proddate")
  data <- data[, !names(data) %in% ignore_cols]
  unlink(dir, recursive = TRUE)
  
  return(data)
}