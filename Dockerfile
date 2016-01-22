FROM quay.io/keboola/docker-base-r:3.2.1-d
MAINTAINER Ondrej Popelka <ondrej.popelka@keboola.com>

COPY init.R /tmp/init.R

WORKDIR /tmp

# Install some commonly used R packages 
RUN /usr/local/src/R/Rscript /tmp/init.R

# Install nloptr package
RUN curl http://ab-initio.mit.edu/nlopt/nlopt-2.4.2.tar.gz > /tmp/nlopt-2.4.2.tar.gz \
	&& curl https://cran.r-project.org/src/contrib/nloptr_1.0.4.tar.gz > /tmp/nloptr_1.0.4.tar.gz \
	&& tar xvfz /tmp/nloptr_1.0.4.tar.gz \
	&& head /tmp/nloptr/configure -n 3300 > /tmp/nloptr/configure.new \
	&& echo "   ## Keboola fix to build locally" >> /tmp/nloptr/configure.new \
	&& echo "   \$(/usr/local/src/R/Rscript --vanilla -e \"file.copy(from='/tmp/nlopt-2.4.2.tar.gz', to='\${NLOPT_TGZ}')\")" >> /tmp/nloptr/configure.new \
	&& tail -n +3302 /tmp/nloptr/configure >> /tmp/nloptr/configure.new \
	&& rm -rf /tmp/nloptr/configure \ 
	&& mv /tmp/nloptr/configure.new /tmp/nloptr/configure \ 
	&& chmod u+x /tmp/nloptr/configure \
	&& R CMD INSTALL nloptr \
	&& rm -rf /tmp/nlopt-2.4.2.tar.gz /tmp/nloptr_1.0.4.tar.gz /tmp/nloptr \
