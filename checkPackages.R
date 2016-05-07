files <- list.files(pattern = '*.\\.R')

libs <- NULL

for (i in files) {
  con <- file(i)
  lines <- readLines(con)
  lines <- lines[grepl('library\\(', lines)]
  lines <- gsub('(library\\()(.*)(\\))', '\\2', lines)
  libs <- c(libs, lines)
  close(con)
}

installed <- installed.packages()
installed <- installed[, 1]

missing <- libs[!libs %in% installed]

if (length(missing) > 0) {
  install.packages(missing, repos = "https://cran.rstudio.com/")
}
