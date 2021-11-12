library(haven)
library(here)

load_data <- function() {
  path <- "data/ESS9e03_1.spss.zip"
  
  dir <- tempdir()
  tempfile <- unzip(path, files="ESS9e03_1.sav", exdir=dir)
  data <- haven::read_sav(tempfile)
  data <- subset(data, select = -c(name:proddate))
  unlink(dir, recursive = TRUE)
  
  return(data)
}
