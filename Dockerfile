FROM rocker/r-ver:3.4.1

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV R_HOME=/usr/local/lib/R/
ENV PATH=/usr/local/lib/R/bin/:$PATH
ENV TERM=xterm
ENV PATH=/usr/lib/ccache:$PATH

WORKDIR /tmp

# Custom Setup
RUN mkdir /usr/share/doc/R${R_VERSION} \
    && echo 'options(repos = c(CRAN = "https://cran.r-project.org", "https://cran.rstudio.com/", "https://mirrors.nics.utk.edu/cran/", "https://cran.mtu.edu/"))' >> ${R_HOME}/etc/Rprofile.site \
    && echo 'options(download.file.method = "libcurl")' >> ${R_HOME}/etc/Rprofile.site

# Install dependencies for packages (gdal)
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        default-jdk \
        ed \        
		libgdal-dev \
		libproj-dev \
        wget \		
    && rm -rf /var/lib/apt/lists/*

# Install nloptr package
RUN curl -f -L http://ab-initio.mit.edu/nlopt/nlopt-2.4.2.tar.gz > /tmp/nlopt-2.4.2.tar.gz \
	&& curl -f -L https://cran.r-project.org/src/contrib/nloptr_1.0.4.tar.gz > /tmp/nloptr_1.0.4.tar.gz \
	&& tar xvfz /tmp/nloptr_1.0.4.tar.gz \
	&& head /tmp/nloptr/configure -n 3300 > /tmp/nloptr/configure.new \
	&& echo "   ## Keboola fix to build locally" >> /tmp/nloptr/configure.new \
	&& echo "   \$(/usr/local/lib/R/bin/Rscript --vanilla -e \"file.copy(from='/tmp/nlopt-2.4.2.tar.gz', to='\${NLOPT_TGZ}')\")" >> /tmp/nloptr/configure.new \
	&& tail -n +3302 /tmp/nloptr/configure >> /tmp/nloptr/configure.new \
	&& rm -rf /tmp/nloptr/configure \
	&& mv /tmp/nloptr/configure.new /tmp/nloptr/configure \
	&& chmod u+x /tmp/nloptr/configure \
	&& R CMD INSTALL nloptr \
	&& rm -rf /tmp/nlopt-2.4.2.tar.gz /tmp/nloptr_1.0.4.tar.gz /tmp/nloptr

COPY init.R /tmp/init.R

# Install some commonly used R packages 
RUN R CMD javareconf && /usr/local/lib/R/bin/Rscript /tmp/init.R
