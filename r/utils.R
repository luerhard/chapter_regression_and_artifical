box::use(
  dplyr[rename],
  stats[setNames]
)

#' @export
find_var_by_label <- function(df, label) {
  # only select media columns of W1
  var.labels <- unlist(labelled::var_label(df), use.names = F)
  col.labels <- colnames(df)

  bool_vec <- grepl(label, var.labels, ignore.case=TRUE)
  find_cols <- which(bool_vec)

  col.names <- col.labels[find_cols]
  var.names <- var.labels[find_cols]

  setNames(as.list(var.names), col.names)
}

