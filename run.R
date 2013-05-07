setwd('~/Dropbox/Projects/ShinyApps')

if(!require(shiny) | !require(shinyIncubator) | !require(devtools) | !require(ggplot2)) {
	install.packages(c('devtools','ggplot2'), repos='http://cran.r-project.org')
	require(devtools)
	install_github('shiny', 'rstudio')
	install_github('shiny-incubator', 'rstudio')
	require(shiny)
	require(ggplot2)
	require(shinyIncubator)
}

# Run locally
runApp('gambler')
runApp('lottery')

# Run from Github
shiny::runGitHub('ShinyApps', 'jbryer', subdir='gambler')
shiny::runGitHub('ShinyApps', 'jbryer', subdir='lottery')

# Run from Gist
shiny::runGist("5525690") #Lottery

##### Some other examples that are not mine #####
# See also http://rstudio.github.io/shiny/tutorial
# Data input
runGitHub("rShinyApps","brianbolt",subdir="handsontable.simple")
install_github('shinyExt','marcionicolau')
runGitHub(repo='shinyExt','marcionicolau', ref="develop", subdir="inst/examples/handsonTable")
# Example to upload file.
# http://www.premiersoccerstats.com/wordpress/?p=1328
