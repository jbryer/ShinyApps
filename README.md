#### Shiny Apps

This repository hosts some [Shiny](http://rstudio.com/shiny) apps I have developed. The [`run.R`](https://github.com/jbryer/ShinyApps/blob/master/run.R) script can be used to get started.

* `gambler` - Simple app that lets you simulate a sequence of random events, for example coin flips, and plot the cummulative sum. This app allows you choose the odds of winning, the number of games to simulate, and the number of simulations to display simultaneously. 

	![Gambler Shiny App](screens/gambler-small.png)

		shiny::runGitHub('ShinyApps', 'jbyrer', subdir='gambler')

* `lottery` - Similar to the `gambler` app, this simulates buying a series of lottery tickets with varying odds of winning different amounts. Each previous run is saved and plotted in light grey to show how the current run compares to past runs.

	![Lottery Tickets Shiny App](screens/lottery-small.png)
	
		shiny::runGitHub('ShinyApps', 'jbyrer', subdir='lottery')
