# Calculation of Shannon Diversity Index values for junction floristics
# abundance data 2025 Script
# Author: Gwendolyn Watt

## Load in libraries
library(vegan)
library(plyr)
library(readxl)
library(tidyverse)

## Call in data
data <- read_excel("abundance_data.xlsx")

View(data)

## Filter out rock, litter, and bareground percent covers
data_plants <- subset(data, !(species_or_id %in% c("rock", "litter", "bareground")))

## Calculate shannon's index for each plot
shannon_index_p <- ddply(data_plants, .(habitat, transect, plot), 
                    function(data_plants)
                      diversity(data_plants$percent_cover, index = "shannon"))

shannon_index_p

## Calculate shannon's index for each transect (average plot H per transect)
shannon_index_t <- ddply(shannon_index_p, .(habitat, transect), 
                       function(shannon_index_p)
                         mean(shannon_index_p$V1))

shannon_index_t


## Calculate mean Shannon's diversity index for each habitat
### Create function for mean
calculate_mean <- function(x) {
  mean <- mean(x)
  return(data.frame(mean_H = mean))
}

### Calculate
shannon_index_mean <- ddply(shannon_index_t, .(habitat), 
                         function(shannon_index_t)
                           calculate_mean(shannon_index_t$V1))
shannon_index_mean

