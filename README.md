# Junction floristics repository

This repository contains all of the pertinent data and R scripts used in or created as part of a floristics survey in Junction, TX from 2025-2026 which has been published under the title "A floristic survey of a critically understudied region of west central Texas for enhancing conservation, research, and education"

## Contact for additional data or for questions

Lead author: Gwendolyn Watt, gwen.r.wagner@gmail.com

## Repository roadmap

### [figures folder](https://github.com/gwenwagner/junction_floristics/tree/main/figures)

This folder contains:

* [junction\_floristics\_thesis\_rscript.R](https://github.com/gwenwagner/junction_floristics/blob/main/figures/junction_floristics_thesis_rscript.R): R script used to create figures depicting average monthly temperatures and precipitation in Junction, TX (Figures 2.3 and 2.4 from the publication)
* [MonthlyClimateNormals\_NOAA\_Junction4SSW\_19912020.csv](https://github.com/gwenwagner/junction_floristics/blob/main/figures/MonthlyClimateNormals_NOAA_Junction4SSW_19912020.csv): NOAA data used to create the aforementioned figures

### [floristics\_data folder](https://github.com/gwenwagner/junction_floristics/tree/main/floristics_data)

This folder includes all the data collected as part of this survey organized into separate folders.

#### [abundance\_data folder](https://github.com/gwenwagner/junction_floristics/tree/main/floristics_data/abundance_data)

* [abundance\_data.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/abundance_data/abundance_data.xlsx): Data of the percent cover or relative abundance of each species encountered in each transect plot.
* [abundance\_metadata.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/abundance_data/abundance_metadata.xlsx): Metadata explaining the columns found in the abundance data.
* [abundance\_H\_calcs.R](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/abundance_data/abundance_H_calcs.R): R script used to calculate the plot, transect, and habitat-level Shannon Diversity Index values.

#### [presence\_data folder](https://github.com/gwenwagner/junction_floristics/tree/main/floristics_data/presence_data)

* [presence\_data.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/presence_data/presence_data.xlsx): Data for every specimen collected in the course of this survey.
* [presence\_metadata\_xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/presence_data/presence_metadata.xlsx): Metadata explaining the columns found in the presence data.

#### [transects folder](https://github.com/gwenwagner/junction_floristics/tree/main/floristics_data/transects)

* [transect\_data.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/transects/transect_data.xlsx): Data for each transect completed in the course of this survey.
* [transect\_metadata.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/transects/transect_metadata.xlsx): Metadata explaining the columns found in the transect data.

#### [waypoints folder](https://github.com/gwenwagner/junction_floristics/tree/main/floristics_data/waypoints)

* [waypoint\_data.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/waypoints/waypoint_data.xlsx): Data for each waypoint visited in the course of this survey.
* [waypoint\_metadata.xlsx](https://github.com/gwenwagner/junction_floristics/blob/main/floristics_data/waypoints/waypoint_metadata.xlsx): Metadata explaining the columns found in the waypoint data.

### [maps folder](https://github.com/gwenwagner/junction_floristics/tree/main/maps)

This folder contains:

* [map\_data\_overview.pdf](https://github.com/gwenwagner/junction_floristics/blob/main/maps/map_data_overview.pdf): A document detailing all of the data and their respective sources used when creating the maps found throughout the publication.
* [map\_data\_files folder](https://github.com/gwenwagner/junction_floristics/tree/main/maps/map_data_files): This folder contains kml files that the author had to create herself. Other data files used to create the maps found in the publication were not included due to their size. Please visit the links provided in the overview pdf to access all of the data used for mapping, or contact the author for the exact files used.

### [point\_generation folder](https://github.com/gwenwagner/junction_floristics/tree/main/point_generation)

This folder contains:

* [sampling\_design.R](https://github.com/gwenwagner/junction_floristics/blob/main/point_generation/sampling_design.R): R script used to generate random points within the study area which were then mapped on Caltopo and sorted through to select transect sites.
* [updated\_junction\_floristics\_boundaries.kml](https://github.com/gwenwagner/junction_floristics/blob/main/point_generation/updated_junction_floristics_boundaries.kml): kml file used to tell the R script where to generate random points. Note that this file only includes the three largest land parcels owned by the TTU Center at Junction.

## Citing this repository

The current Zenodo doi badge for this repository is: 10.5281/zenodo.20947317

