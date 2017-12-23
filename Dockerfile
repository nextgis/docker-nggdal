##
# nextgis/gdal
#
# This creates an Ubuntu derived base image that installs the latest GDAL
# release from NextGIS (built with NextGIS Borsch).
# <https://github.com/nextgis-borsch/lib_gdal>
#

# Ubuntu 16.04 Xenial Xerus
FROM ubuntu:xenial

MAINTAINER Maxim Dubinin <maxim.dubinin@nextgis.com>

# Externally accessible data is by default put in /data
WORKDIR /data
VOLUME ["/data"]

# add nextgis repo
RUN add-apt-repository -y ppa:nextgis/ppa

# Install stuff
RUN apt-get update -y
RUN apt-get install software-properties-common python-software-properties
RUN apt-get install gdal-bin python-gdal
RUN apt-get install nextgisutilities-bin

# Clean up
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats
