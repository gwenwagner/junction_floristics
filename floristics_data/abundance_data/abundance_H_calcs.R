# Calculation of Shannon Diversity Index values and other relevant values 
# for junction floristics abundance data 2025 Script
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

## Calculate shannon's index for each transect (average of two plots)
shannon_index_t <- ddply(shannon_index_p, .(habitat, transect), 
                         function(shannon_index_p)
                           mean(shannon_index_p$V1))
shannon_index_t


## Calculate mean Shannon's diversity index for each habitat 
## (average of 4 transects)
shannon_index_mean <- ddply(shannon_index_t, .(habitat), 
                         function(shannon_index_t)
                           mean(shannon_index_t$V1))
shannon_index_mean

## N. leucotricha percent of total cover calc
### total cover calc
total_cover <- sum(data_plants$percent_cover)
total_cover

### N. leuco cover calc
#### subset data
NaLe_data <- subset(data_plants, species_or_id == "Nassella leucotricha")
NaLe_cover <- sum(NaLe_data$percent_cover)
NaLe_cover

### Divide and *100
(NaLe_cover/total_cover)*100

