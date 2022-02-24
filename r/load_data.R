box::use(
  haven[as_factor],
  tidyr[drop_na],
  dplyr[...],
  tibble[as_tibble],
  here[here],
  tibble[as_tibble]
)


#' @export
ess1 <- function() {
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
preprocess <- function(ess) {
  schwartz_cols <- c(
    "imprich", "iprspot", "ipshabt", "ipsuces", "impfun", "ipgdtim",
    "impdiff", "ipadvnt", "ipeqopt", "ipudrst", "impenv", "iphlppl",
    "iplylfr", "ipmodst", "imptrad", "ipbhprp", "ipfrule", "impsafe",
    "ipstrgv"
  )
  
  df <- ess %>%
    mutate_at(
      # reverse coding and substract mrat from all schwartz cols
      all_of(schwartz_cols), list(~ car::recode(.,
                                          "1 = 6; 2 = 5; 3 = 4; 4 = 3; 5 = 2; 6 = 1"
      ))
    ) %>%
    mutate(
      # mrat = mean over all schwarz cols
      mrat = rowMeans(across(all_of(schwartz_cols)))
    ) %>%
    mutate_at(
      all_of(schwartz_cols), list(~ . - mrat)
    ) %>%
    transmute(
      # controls
      gender = dplyr::recode(as_factor(gndr), "Male" = 0, "Female" = 1),
      age = ifelse(agea > 18, agea, NA),
      relig = rlgdgr,
      educ = ifelse(eduyrs < 30, eduyrs, NA),
      country = haven::as_factor(cntry),
      left_right = lrscale,
      income = car::recode(hincfel, "1 = 4; 2 = 3; 3 = 2; 4 = 1"),
      # AV
      reject = rowMeans(across(c(imdfetn, imsmetn, impcntr))),
      reject_bin = haven::as_factor(ifelse(reject > 2.5, 1, 0)),
      # Schwartz
      # create values
      # s_power = rowMeans(across(c(imprich, iprspot))),
      # s_achievement = rowMeans(across(c(ipshabt, ipsuces))),
      # s_hedonism = rowMeans(across(c(impfun, ipgdtim))),
      # s_stimulation = rowMeans(across(c(impdiff, ipadvnt))),
      # s_selfdirecton = rowMeans(across(c(ipcrtiv, impfree))),
      # s_unversalism = rowMeans(across(c(ipeqopt, ipudrst, impenv))),
      # s_benevolence = rowMeans(across(c(iphlppl, iplylfr))),
      # s_tradition = rowMeans(across(c(ipmodst, imptrad))),
      # s_conformity = rowMeans(across(c(ipbhprp, ipfrule))),
      # s_security = rowMeans(across(c(impsafe, ipstrgv))),
      # create dimensions
      s_dim_conservation = rowMeans(across(c(impsafe, ipstrgv, ipfrule, ipbhprp, ipmodst, imptrad))),
      s_dim_trancendence = rowMeans(across(c(ipeqopt, ipudrst, impenv, iphlppl, iplylfr)))
    ) %>%
    drop_na()
  
  return(df)
}
