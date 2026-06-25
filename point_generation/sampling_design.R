## sampling_design.R
## 2025-01-31
## Dylan Schwilk

## code to create stratified randomly sampled transect locations.

library(sf)
library(terra)
library(dplyr)
library(geosphere)
library(ggplot2) 


## Return n points uniformly distributed in polygon. "Extra" is expected buffer
## needed as a proportion.
get_points_in_poly <- function(n, poly, extra=0.2) {
  # Get a bounding box as limits for random uniform 2d points
  bbox <- st_bbox(poly)

  # assume we need 15% more points to cover losses due to bounding box vs
  # polyon (just a guess). Then grab 1.15n points in bounding box
  x <- runif(n*(1+extra), bbox$xmin, bbox$xmax)
  y <- runif(n*(1+extra), bbox$ymin, bbox$ymax)
  points <- st_as_sf(data.frame(x=x,y=y), coords=c("x","y"), crs=st_crs(poly))
  points <- st_filter(points, poly)
 # print(nrow(points))
  while (nrow(points) < n ) { # get more if needed %15?
    x <- runif(n*extra, bbox$xmin, bbox$xmax)
    y <- runif(n*extra, bbox$ymin, bbox$ymax)
    new_points <- st_as_sf(data.frame(x=x,y=y), coords=c("x","y"), crs=st_crs(poly))
    new_points <- st_filter(new_points, poly)
  #  print(nrow(new_points))
    points <- rbind(points, new_points)
  #  print(nrow(points))
  }
  # trim to what we need:
  points <- head(points, n)
  return(points)
}


################################################################################
## Read data
################################################################################

# Read unit boundaries. kml file contains two polygons, one for the state park
# ("slr") and the other for the TTU Junction campus area ("ttu").
boundaries <- st_read("../data/updated_junction_floristics_boundaries.kml")
# Clean out extra all NA columns was in kml (probably an artifact of kml
# creation).
boundaries <- dplyr::select(boundaries, property_id=Name, geometry)
boundaries[1,1] <- "slr"
boundaries[2,1] <- "ttu"
boundaries[3,1] <- "ttu"
boundaries[4,1] <- "ttu"
boundaries$property_id
# [1] "slr" "ttu" "ttu" "ttu"




## Work out code for one site first
slr <- filter(boundaries, property_id=="slr")
samples <- get_points_in_poly(50, slr )
st_write(samples, "../results/slr_points_15.kml")  


ttu <- filter(boundaries, property_id=="ttu")
samples <- get_points_in_poly(50, ttu )
st_write(samples, "../results/ud_ttu_points_6.kml")  
