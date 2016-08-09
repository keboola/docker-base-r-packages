# install really required packages
install.packages(
	c('Cairo', 'curl', 'DBI', 'devtools', 'git2r', 'jsonlite', 'rJava', 'RJDBC', 'roxygen2', 'rversions', 'rstudioapi'), 
	dependencies = c("Depends", "Imports", "LinkingTo"), 
	INSTALL_opts = c("--no-html")
)

# install some commonly used packages
install.packages(
	c(
		'ascii', 
		'BH', 'bitops', 'brew', 'BTYD',
		'car', 'caret', 'caTools', 'corrgram', 'Cubist',
		'datasets', 'data.table', 'data.tree', 'digest', 'ddd', 'doParallel', 'dplyr',
		'evaluate', 'earth', 'ellipse', 'e1071',
		'forecast', 'foreach',
		'gam', 'gbm', 'gdata', 'ggplot2', 'ggvis', 'graphics', 'grDevices', 'gsl',
		'httr',
		'ipred', 'ISOweek',
		'kernlab', 'klaR', 
		'lattice', 'leaps',
		'MASS', 'magrittr', 'mda', 'mime', 'moments', 'memoise', 'methods', 'mgcv', 'mlbench',
		'nlme', 'nnet', 
		'outliers', 
		'party', 'pamr', 'pls', 'plyr', 'pROC', 'proxy',
		'qdap', 'quantreg',
		'randomForest', 'RANN', 'reshape2', 'R6', 'Rcpp', 'RcppArmadillo', 'rgdal',
		'sp', 'spls', 'sqldf', 'stringi', 'stringr', 'subselect', 'superpc', 'stats',
		'testthat', 'timeDate', 'tree',
    	'utils',
    	'whisker',
    	'xml2',
    	'zoo'
	), 
	dependencies = c("Depends", "Imports", "LinkingTo"), 
	INSTALL_opts = c("--no-html")
)

packageurl <- "https://cran.r-project.org/src/contrib/Archive/ChannelAttribution/ChannelAttribution_1.7.tar.gz"
install.packages(packageurl, repos=NULL, type="source")
