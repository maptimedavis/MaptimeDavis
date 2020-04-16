# R spatial topics

A list of Maptime Topics on R

1. [NDVI Time Series from Landsat](NDVI-TimeSeriesR/NDVI-TimeSeriesR.md)
1. [Analyzing Animal Health Spatial-Explicit Networks Using R](https://drive.google.com/a/ucdavis.edu/file/d/1WXpWxWk4rqJaCx2ybFSOjng7T4cwwRg8/view?usp=sharing) - Feb 2019
1. [Rspatial Introduction](#rspatial-Introduction)
1. [Species Distribution Modeling](#species-distribution-modeling)
1. [Maps With R](../MapsWithR)
1. [Interactive Maps with R](../MapsWithR)

## Rspatial Introduction
1:00-3:00 | Monday, October 15th, 2017 | DSI Classroom | 360 Shields Library
https://spatial.ucdavis.edu/2018/10/08/maptimedavis-intro-to-r-spatial/

2:00-4:00 | Monday, October 16th, 2017 | DSI Classroom | 360 Shields Library
https://spatial.ucdavis.edu/2017/10/09/maptimedavis-rspatial-org/

An introduction to R for geospatial topics with [RSpatial.org](http://rspatial.org) Learn to load, analyze, and visualize spatial data with a robust accessible online tutorial with the help of knowledgeable instructors.

### Prepare

 * Install R and Rstudio
 * Download all the code, data, and answers. https://github.com/MicheleTobias/MaptimeDavis/archive/master.zip
 * Unzip the data in the Rspatial folder.
 * *Note*: you may need to install packages, primarily sp,rgdal,rgeos and raster ```install.packages(c('sp','rgdal','rgeos','raster'))```

### Background Materials

Slide presentations on the topics:

 * [What is Rspatial.org](https://www.scribd.com/document/357651325/rspatial-foss4g2017)
 * [Vectors in R](https://gfc.ucdavis.edu/events/dar2018/_static/talks/3_spatial_vector.pdf)
 * [Projections(CRS|SRS) in R](http://gfc.ucdavis.edu/events/arusha2016/_static/talks/day1_6_spatial_2_crs.pdf)
 * [Rasters in R](https://gfc.ucdavis.edu/events/dar2018/_static/talks/4_spatial_raster.pdf)
 * [Mapping in R](http://gfc.ucdavis.edu/events/arusha2016/_static/talks/day2_2_spatial_4_maps.pdf)
 
## Intro to Vectors

1. Read and try code about Vectors in R, http://rspatial.org/spatial/index.html 
    1. Sections 1, 2, 3
    1. Section 6.1 to 6.4  
1. Try to solve the questions in 1_Vectors.R

## Intro to Rasters

1. Read and try code about Rasters in R
    1. Carefully read http://rspatial.org/spatial/rst/4-rasterdata.html
    1. Create raster data examples, as shown
    1. And quickly read http://rspatial.org/spatial/rst/8-rastermanip.html
1. Try to solve the questions and code in 2_Rasters.R

## Plotting Maps (Optional)

1. Read about [Mapping in R](http://rspatial.org/spatial/rst/9-maps.html)
1. Read and try to answer the Exercises (Ex:) in 3_Mapping.Rmd (Open with Rstudio and use Knit to view the html)


## Species Distribution Modeling

1:00-3:00pm | Tuesday, May 29th, 2018 | DSI Classroom | room 360 Shields Library
https://spatial.ucdavis.edu/2018/05/24/maptimedavis-r-species-distribution-modeling-bigfoot/

1. [Presentation](modelingbigfoot.pptx)
1. [Code](ModelingBigfoot.R)
1. More details on http://rspatial.org/analysis/rst/5-global_regression.html
