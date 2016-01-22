# install really required packages
install.packages(c('curl', 'DBI', 'devtools', 'git2r', 'jsonlite', 'rJava', 'RJDBC', 'roxygen2', 'rversions', 'rstudioapi'), repos = 'http://cran.us.r-project.org', dependencies = c("Depends", "Imports", "LinkingTo"), INSTALL_opts = c("--no-html"))

# install some commonly used packages
install.packages(
	c(
		'BH', 'brew',
		'caret', 'corrgram', 
		'datasets', 'data.table', 'digest', 'dplyr',
		'evaluate',
		'forecast',
		'gbm', 'ggplot2', 'ggvis', 'graphics', 'grDevices',
		'httr',
		'leaps',
		'magrittr', 'mime', 'moments', 'memoise', 'methods',
		'plyr', 
		'quantreg',
		'R6', 'Rcpp',
		'stringi', 'stringr', 'stats',
		'timeDate'
    	'utils',
    	'whisker',
    	'xml2',
    	'zoo'
	), 
	repos = 'http://cran.us.r-project.org', 
	dependencies = c("Depends", "Imports", "LinkingTo"), 
	INSTALL_opts = c("--no-html")
)

library('devtools')

# install the R application
install_github('keboola/r-application', ref = "master")
install_github('keboola/r-docker-application', ref = "master")
