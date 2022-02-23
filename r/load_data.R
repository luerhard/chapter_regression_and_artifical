box::use(
  haven[as_factor],
  dplyr[`%>%`, select, filter, mutate],
  tibble[as_tibble]
  )

box::use(tibble[as_tibble])


prepare_ess1 <- function(df) {
  df <- df %>%
    mutate(
      acetalv = haven::as_factor(acetalv),
      brncntr = haven::as_factor(brncntr),
      cntry = haven::as_factor(cntry),
      edulvla = haven::as_factor(edulvla),
      eimpcnt = haven::as_factor(eimpcnt),
      eimrcnt = haven::as_factor(eimrcnt),
      gndr = haven::as_factor(gndr),
      hincfel = haven::as_factor(hincfel),
      impcntr = haven::as_factor(impcntr),
      imrcntr = haven::as_factor(imrcntr)
    )
  
  return(df)
}


#' @export
ess1 <- function(raw = FALSE) {
  path <- "data/ESS1e06_6.spss.zip"
  filename <- "ESS1e06_6.sav"
  dir <- tempdir()
  
  tempfile <- utils::unzip(path, files = filename, exdir = dir)
  df <- haven::read_sav(tempfile)

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
