devtools::install_github('jbryer/DATA606')
devtools::install_github('jbryer/IRRsim')

# Shiny apps that use NYS Report Card Data
# https://github.com/jbryer/NYSchools
shiny::runGitHub('NYSchools','jbryer', subdir='NYSEnrollment')
shiny::runGitHub('NYSchools','jbryer', subdir='NYSReportCard')

library(IRRsim)
IRRsim_demo()

library(DATA606)
shiny_demo() # Lists shiny apps in the DATA606 package
shiny_demo('BayesBilliards')
shiny_demo('gambler')
shiny_demo('lottery')
