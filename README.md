# Junction floristics repository
The repository contains all of the pertinent data and R scripts used in or created as part of a floristics survey in Junction, TX from 2025-2026 
which has been published under the title "A floristic survey of a critically understudied region of west central Texas for enhancing 
conservation, research, and education"

## Contact for additional data or for questions
Lead author: Gwendolyn Watt, gwen.r.wagner@gmail.com

## Repository roadmap
### figures folder
This folder contains:
- junction_floristics_thesis_rscript.R: R script used to create figures depicting average monthly temperatures and
  precipitation in Junction, TX (Figures 2.3 and 2.4 from the publication)
- MonthlyClimateNormals_NOAA_Junction4SSW_19912020.csv: NOAA data used to create the aforementioned figures

### floristics_data folder
This folder includes all the data collected as part of this survey organized into separate folders.
#### abundance_data folder
- abundance_data.xlsx: Data of the percent cover or relative abundance of each species encountered in each transect plot.
- abundance_metadata.xlsx: Metadata explaining the columns found in the abundance data.
- abundance_H_calcs.R: R script used to calculate the plot, transect, and habitat-level Shannon Diversity Index values.
#### presence_data folder
- presence_data.xlsx: Data for every specimen collected in the course of this survey.
- presence_metadata_xlsx: Metadata explaining the columns found in the presence data.
#### transects
- transect_data.xlsx: Data for each transect completed in the course of this survey.
- transect_metadata.xlsx: Metadata explaining the columns found in the transect data.
#### waypoints
- waypoint_data.xlsx: Data for each waypoint visited in the course of this survey.
- waypoint_metadata.xlsx: Metadata explaining the columns found in the waypoint data.

### maps
This folder contains: 
- map_data_overview.pdf: A document detailing all of the data and their respective sources used when creating the maps found
  throughout the publication.
- map_data_files folder: This folder contains kml files that the author had to create herself. Other data files used to create the
  maps found in the publication were not included due to their size. Please visit the links provided in the overview pdf to access
  all of the data used for mapping, or contact the author for the exact files used.

### point_generation
This folder contains:
- sampling_design.R: R script used to generate random points within the study area which were then mapped on Caltopo and sorted
  through to select transect sites.
- updated_junction_floristics_boundaries.kml: kml file used to tell the R script where to generate random points. Note that this file
  only includes the three largest land parcels owned by the TTU Center at Junction.
