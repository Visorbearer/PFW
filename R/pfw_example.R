#' Download and Load Example Project FeederWatch Dataset
#'
#' Provides a sample dataset for demonstration and testing purposes.
#' This dataset includes data from 2021 - May 2024 from
#' Washington, Oregon, and California.
#'
#' @return A dataset of example Project FeederWatch data.
#' @export
pfw_example <- function() { # nocov start
  path <- system.file("extdata", "pfw_example.csv", package = "PFW")
  # If not found, download from the GitHub repository to a temp file
  if (path == "") {
    message("Local example dataset not found. Downloading from GitHub...")

    url <- "https://raw.githubusercontent.com/Visorbearer/PFW/main/inst/extdata/pfw_example.csv"
    path <- tempfile(fileext = ".csv")

    tryCatch(
      {
        utils::download.file(url, path, mode = "wb")
      },
      error = function(e) {
        stop("Failed to download example dataset: ", e$message)
      }
    )
  }
  data <- read.csv(path, stringsAsFactors = FALSE)
  attr(data, "pfw_import_path") <- dirname(path)
  message("Example dataset loaded.")
  return(invisible(data))
} # nocov end
