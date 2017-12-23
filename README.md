# GDAL Docker Images

This is an Ubuntu derived image containing the Geospatial Data Abstraction
Library (GDAL) compiled with a broad range of drivers. This GDAL version is
built with NextGIS Borsch.

## Usage

Running the container without any arguments will by default output the GDAL
version string as well as the supported raster and vector formats:

    docker run nextgis/gdal

The following command will open a bash shell in an Ubuntu based environment
with GDAL available:

    docker run -t -i nextgis/gdal /bin/bash

You will most likely want to work with data on the host system from within the
docker container, in which case run the container with the -v option. Assuming
you have a raster called `test.tif` in your current working directory on your
host system, running the following command should invoke `gdalinfo` on
`test.tif`:

    docker run -v $(pwd):/data nextgis/gdal gdalinfo test.tif

This works because the current working directory is set to `/data` in the
container, and you have mapped the current working directory on your host to
`/data`.


