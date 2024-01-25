###############################################
## Retrieving data from Global Fishing Watch ##
## Author: Felipe Quezada                    ##
###############################################


# Activate GFW package 
library(gfwr)

# Authorization
key <- gfw_auth()

# Retrieve information 


# Obtain trawler vessels in Chile
chile_trawlers <- get_vessel_info(
  query = "flag = 'CHL' AND geartype = 'trawlers'", 
  search_type = "advanced", 
  dataset = "fishing_vessel",
  key = key
)
chile_trawler_ids <- paste0(chile_trawlers$id[1:100], collapse = ",")


chile_fishing_effort <- get_event(event_type = "fishing",
          vessel = chile_trawler_ids,
          start_date = "2021-01-01",
          end_date = "2021-02-01",
          key = key
)

chile_port_visit <- get_event(event_type = "port_visit",
                                  vessel = chile_trawler_ids,
                                  start_date = "2021-01-01",
                                  end_date = "2021-02-01",
                                  key = key
)