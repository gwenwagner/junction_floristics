# Junction Floristics Thesis Work
# Author: Gwen Watt
# Date last updated: 11/6/25

# Set working directory to thesis_work

## Creating a graph of Junction climate data for thesis introduction
## Load libraries
library(ggplot2)
library(tidyverse)
library(plyr)
library(reshape2)

## Call data
j_climate <- read.csv('junction_climate_data/MonthlyClimateNormals_NOAA_Junction4SSW_19912020.csv')

## Create month_name column
j_climate$monthname <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
                         "Aug", "Sep", "Oct", "Nov", "Dec")

## Make data long format
j_climate_long <- melt(j_climate, id = c("STATION", "DATE", "LATITUDE", 
                                         "LONGITUDE", "ELEVATION", "NAME",
                                         "month", "day", "hour", "monthname"), 
                       variable.name = "climate_var", value.name = "value")
View(j_climate_long)

## Plots
### Temperature
#### Subset data for temp values of interest
j_climate_long_t <- subset(j_climate_long, climate_var == "MLY.TAVG.NORMAL" | 
                             climate_var == "MLY.TMAX.NORMAL" | 
                             climate_var == "MLY.TMIN.NORMAL")
View(j_climate_long_t)

#### Make R recognize value column as numeric
j_climate_long_t$value <- as.numeric(j_climate_long_t$value)

#### Make R recognize climate_var column as factor and order
j_climate_long_t$climate_var <- factor(j_climate_long_t$climate_var, 
                                       levels = c("MLY.TMAX.NORMAL", 
                                                  "MLY.TAVG.NORMAL", 
                                                  "MLY.TMIN.NORMAL"))

#### Make R recognize monthname column as factor and order
j_climate_long_t$monthname <- factor(j_climate_long_t$monthname, 
                                   levels = c("Jan", "Feb", "Mar", "Apr", "May",
                                              "Jun", "Jul", "Aug", "Sep", "Oct",
                                              "Nov", "Dec"))

#### Plot
ggplot(j_climate_long_t, aes(x = monthname, y = ((value-32)*(5/9)), group = climate_var, 
                             color = climate_var, shape = climate_var)) +
  scale_color_manual(name = " ", labels = c("Monthly Average Max Temp", 
                                            "Monthly Average Temp",
                                            "Monthly Average Min Temp"),
                     values = c("red", "black", "blue")) +
  geom_line() + 
  geom_point(size = 1.75) +
  scale_shape_manual(name = " ", labels = c("Monthly Average Max Temp", 
                                            "Monthly Average Temp",
                                            "Monthly Average Min Temp"),
                     values = c(15, 19, 17)) +
  ylim(-10, 40) +
  labs(#title = "Monthly Temperature Normals for Junction, TX (1991 - 2020)",
       x = "Month",
       y = "Temperature (°C)") +
  theme_bw() + theme(panel.grid.major.x = element_blank())

### Precipitation
#### Subset data for precip values of interest
j_climate_long_p <- subset(j_climate_long, climate_var == "MLY.PRCP.NORMAL" | 
                             climate_var == "MLY.PRCP.25PCTL" | 
                             climate_var == "MLY.PRCP.75PCTL")
View(j_climate_long_p)

#### Make data wide
j_climate_wide_p <- j_climate_long_p %>% pivot_wider(names_from = climate_var,
                                                     values_from = value)
View(j_climate_wide_p)

#### Make R recognize value columns as numeric
j_climate_wide_p$MLY.PRCP.NORMAL <- as.numeric(j_climate_wide_p$MLY.PRCP.NORMAL)
j_climate_wide_p$MLY.PRCP.25PCTL <- as.numeric(j_climate_wide_p$MLY.PRCP.25PCTL)
j_climate_wide_p$MLY.PRCP.75PCTL <- as.numeric(j_climate_wide_p$MLY.PRCP.75PCTL)

#### Make R recognize monthname column as factor and order
j_climate_wide_p$monthname <- factor(j_climate_wide_p$monthname, 
                                     levels = c("Jan", "Feb", "Mar", "Apr", "May",
                                                "Jun", "Jul", "Aug", "Sep", "Oct",
                                                "Nov", "Dec"))

#### Plot
ggplot(j_climate_wide_p, aes(x = monthname, y = (MLY.PRCP.NORMAL*25.4),
                             ymin = (MLY.PRCP.25PCTL*25.4), 
                             ymax = (MLY.PRCP.75PCTL*25.4))) +
  geom_line(aes(group = ''), color = "dodgerblue3") + 
  geom_ribbon(aes(group = ''), fill = "dodgerblue", alpha = 0.3) +
  labs(#title = "Monthly Precipitation Normals for Junction, TX (1991 - 2020)",
       x = "Month",
       y = "Precipitation (mm)") +
  theme_bw() + theme(panel.grid.major.x = element_blank())
  