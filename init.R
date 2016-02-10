# install really required packages
install.packages(
	c('Cairo', 'curl', 'DBI', 'devtools', 'git2r', 'jsonlite', 'rJava', 'RJDBC', 'roxygen2', 'rversions', 'rstudioapi'), 
	dependencies = c("Depends", "Imports", "LinkingTo"), 
	INSTALL_opts = c("--no-html")
)

# install some commonly used packages
install.packages(
	c(
		'BH', 'brew', 'BTYD',
		'caret', 'corrgram', 
		'datasets', 'data.table', 'digest', 'dplyr',
		'evaluate',
		'forecast',
		'gbm', 'gdata', 'ggplot2', 'ggvis', 'graphics', 'grDevices',
		'httr',
		'leaps',
		'magrittr', 'mime', 'moments', 'memoise', 'methods',
		'plyr', 
		'quantreg',
		'R6', 'Rcpp',
		'stringi', 'stringr', 'stats',
		'timeDate', 'tree',
    	'utils',
    	'whisker',
    	'xml2',
    	'zoo'
	), 
	dependencies = c("Depends", "Imports", "LinkingTo"), 
	INSTALL_opts = c("--no-html")
)
