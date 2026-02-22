# Pulling Rocker image with RStudio and R version 4.2
FROM rocker/rstudio:4.5

# Disabling the authentication step
ENV USER="rstudio"
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--auth-none", "1"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    libxml2-dev \
    zlib1g \
    g++-11 \
    libz-dev \
    freetype2-demos \
    libpng-dev \
    libtiff-dev \
    libjpeg-dev \
    make \
    fontconfig \
    libfribidi-dev \
    libharfbuzz-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    git \
    vim \
    libgl1 \
    libegl1 \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2t64 \
    libxi6 \
    libxtst6 \
    gpg-agent \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-xetex \
    lmodern \
    && rm -rf /var/lib/apt/lists/*

# installing R packages
RUN mkdir packages 
COPY install_packages.R packages/
COPY packages.json packages/
# RUN Rscript packages/install_packages.R

# Install additional R packages
RUN Rscript -e "install.packages(c('vitae', 'scholar', 'googlesheets4'), repos = 'http://cran.rstudio.com/')"

EXPOSE 8787