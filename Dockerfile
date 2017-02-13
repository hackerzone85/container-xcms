FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase:latest

MAINTAINER PhenoMeNal-H2020 Project (phenomenal-h2020-users@googlegroups.com)

LABEL software=xcms
LABEL software.version=1.50.1
LABEL version=0.1
LABEL Description="XCMS: Framework for processing and visualization of chromatographically separated and single-spectra mass spectral data."

# Install packages for compilation
RUN apt-get -y --no-recommends install make gcc gfortran g++ libnetcdf-dev

# Install XCMS
RUN R -e 'source("https://bioconductor.org/biocLite.R"); biocLite("xcms")'

# De-install not needed packages
RUN apt-get remove --purge --auto-remove make gcc gfortran g++

# Add scripts folder to container
ADD show_chromatogram.r /usr/local/bin/show_chromatogram.r
RUN chmod +x /usr/local/bin/show_chromatogram.r

# Define Entry point script
#ENTRYPOINT ["Rscript"]
