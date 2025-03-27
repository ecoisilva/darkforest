#' Install the darkforest theme for RStudio
#'
#' This function installs the darkforest theme for RStudio.
#'
#' @return NULL
#' @export
install_theme <- function() {

  # Ensure the RStudio API is available
  if (!rstudioapi::isAvailable()) {
    stop("darkforest must be installed from within RStudio.")
  }

  # Add the darkforest default theme to RStudio
  darkforest_default_theme <- rstudioapi::addTheme(
    fs::path_package(package = "darkforest", "resources", "darkforest.rstheme")
  )

  # Apply the default darkforest theme
  rstudioapi::applyTheme(darkforest_default_theme)
}

#' Uninstall the darkforest theme
#'
#' This function removes the darkforest theme from RStudio and deactivates the custom menu theme.
#'
#' @return NULL
#' @export
uninstall_theme <- function() {

  # Get a list of all installed themes
  installed_darkforest_themes <- grep(
    x = purrr::map_depth(.x = rstudioapi::getThemes(),
                         .depth = 1L, .f = purrr::pluck("name")),
    pattern = "darkforest", value = TRUE
  )

  # Remove the darkforest theme from RStudio
  for (theme in installed_darkforest_themes) {
    rstudioapi::removeTheme(theme)
  }
}
