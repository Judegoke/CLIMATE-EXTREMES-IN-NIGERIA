#>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#>#Intalling & Loading the dataset
install.packages("nasapower", repos = "https://ropensci.r-universe.dev")

install.packages(c("httpcode", "urltools", "jsonlite", "httr", "dplyr", "tidyr", "purrr", "lubridate"))
library(purrr)
library(dplyr)
library(lubridate)
library(readr)
library(nasapower)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# dataframe for cities and coordinates
cities <- data.frame(
  city = c("Lagos", "Abuja", "Kano", "Port Harcourt", "Ibadan", "Maiduguri"),
  lat = c(6.5244, 9.0579, 12.0022, 4.8156, 7.3775, 11.8469),
  lon = c(3.3792, 7.4951, 8.5910, 7.0498, 3.9470, 13.1571)
)


ls("package:nasapower")

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 #Define coordinates for Lagos
lagos_lat <- 6.5244
lagos_lon <- 3.3792

# Pull daily weather data from 2000 to 2023 for Lagos
lagos_weather <- get_power(
  community = "AG", # Agroclimatology community
  pars = c("T2M_MAX", "PRECTOTCORR"), # Max temp, Corrected precipitation
  temporal_api = "DAILY",             # Updated argument name
  lonlat = c(lagos_lon, lagos_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Lagos",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

#Preview data
head(lagos_weather)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Define coordinates for Abuja
abuja_lat <- 9.0578
abuja_lon <- 7.4951

# Pull daily weather data for Abuja
abuja_weather <- get_power(
  community = "AG",
  pars = c("T2M_MAX", "PRECTOTCORR"),
  temporal_api = "DAILY",
  lonlat = c(abuja_lon, abuja_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Abuja",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

head(abuja_weather)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Define coordinates for Port Harcourt
ph_lat <- 4.8156
ph_lon <- 7.0498

# Pull daily weather data for Port Harcourt
ph_weather <- get_power(
  community = "AG",
  pars = c("T2M_MAX", "PRECTOTCORR"),
  temporal_api = "DAILY",
  lonlat = c(ph_lon, ph_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Port Harcourt",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

head(ph_weather)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Define coordinates for Kano
kano_lat <- 12.0022
kano_lon <- 8.5919

# Pull daily weather data for Kano
kano_weather <- get_power(
  community = "AG",
  pars = c("T2M_MAX", "PRECTOTCORR"),
  temporal_api = "DAILY",
  lonlat = c(kano_lon, kano_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Kano",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

head(kano_weather)



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Define coordinates for Kaduna
kaduna_lat <- 10.5105
kaduna_lon <- 7.4165

# Pull daily weather data for Kaduna
kaduna_weather <- get_power(
  community = "AG",
  pars = c("T2M_MAX", "PRECTOTCORR"),
  temporal_api = "DAILY",
  lonlat = c(kaduna_lon, kaduna_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Kaduna",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

head(kaduna_weather)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Define coordinates for Enugu
enugu_lat <- 6.4403
enugu_lon <- 7.4948

# Pull daily weather data for Enugu
enugu_weather <- get_power(
  community = "AG",
  pars = c("T2M_MAX", "PRECTOTCORR"),
  temporal_api = "DAILY",
  lonlat = c(enugu_lon, enugu_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Enugu",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")
  )

head(enugu_weather)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Define coordinates for Ibadan
ibadan_lat <- 7.3775
ibadan_lon <- 3.8953

# Pull daily weather data from 2000 to 2023 for Ibadan
ibadan_weather <- get_power(
  community = "AG",                       # Agroclimatology community
  pars = c("T2M_MAX", "PRECTOTCORR"),    # Max temp, Corrected precipitation
  temporal_api = "DAILY",                 # Daily data
  lonlat = c(ibadan_lon, ibadan_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Ibadan",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")  # Convert YYYYMMDD to Date
  )

# Save to CSV
write_csv(ibadan_weather, "ibadan_weather.csv")

# Preview
head(ibadan_weather)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Define coordinates for Maiduguri
maiduguri_lat <- 11.8469
maiduguri_lon <- 13.1510

# Pull daily weather data from 2000 to 2023 for Maiduguri
maiduguri_weather <- get_power(
  community = "AG",                       
  pars = c("T2M_MAX", "PRECTOTCORR"),    
  temporal_api = "DAILY",                 
  lonlat = c(maiduguri_lon, maiduguri_lat),
  dates = c("2000-01-01", "2023-12-31")
) %>%
  mutate(
    city = "Maiduguri",
    date = as.Date(YYYYMMDD, format = "%Y%m%d")  
  )

# Save to CSV
write_csv(maiduguri_weather, "maiduguri_weather.csv")

# Preview
head(maiduguri_weather)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Save Lagos weather data
write.csv(lagos_weather, "lagos_weather.csv", row.names = FALSE)

# Save Abuja weather data
write.csv(abuja_weather, "abuja_weather.csv", row.names = FALSE)

# Save Port Harcourt weather data
write.csv(ph_weather, "portharcourt_weather.csv", row.names = FALSE)

# Save Kano weather data
write.csv(kano_weather, "kano_weather.csv", row.names = FALSE)

# Save Kaduna weather data
write.csv(kaduna_weather, "kaduna_weather.csv", row.names = FALSE)

# Save Enugu weather data
write.csv(enugu_weather, "enugu_weather.csv", row.names = FALSE)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# List of all city CSVs
files <- c(
  "lagos_weather.csv",
  "abuja_weather.csv",
  "portharcourt_weather.csv",
  "kano_weather.csv",
  "kaduna_weather.csv",
  "enugu_weather.csv",
  "ibadan_weather.csv",
  "maiduguri_weather.csv"
)

# Read and combine all CSVs
library(dplyr)

all_cities_data <- lapply(files, read.csv) %>% bind_rows()

# Preview combined data
head(all_cities_data)

# Save combined dataset
write.csv(all_cities_data, "all_cities_weather.csv", row.names = FALSE)



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

library(dplyr)
library(readr)

# Read combined dataset
all_cities <- read_csv("all_cities_weather.csv", show_col_types = FALSE)

# Create binary flags for extremes
all_cities <- all_cities %>%
  mutate(
    heatwave_day = ifelse(T2M_MAX >= 35, 1, 0),          # 1 if heatwave, 0 otherwise
    extreme_rain_day = ifelse(PRECTOTCORR >= 50, 1, 0)   # 1 if extreme rain, 0 otherwise
  )

# Summarize by year & city
annual_extremes <- all_cities %>%
  group_by(city, YEAR) %>%
  summarise(
    heatwave_days = sum(heatwave_day, na.rm = TRUE),       # total heatwave days
    extreme_rain_days = sum(extreme_rain_day, na.rm = TRUE) # total extreme rain days
  ) %>%
  ungroup()

# Save annual extremes to CSV
write_csv(annual_extremes, "annual_extremes.csv")



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# Create 5-year bins
annual_extremes <- annual_extremes %>%
  mutate(
    five_year_bin = case_when(
      YEAR >= 2000 & YEAR <= 2004 ~ "2000-2004",
      YEAR >= 2005 & YEAR <= 2009 ~ "2005-2009",
      YEAR >= 2010 & YEAR <= 2014 ~ "2010-2014",
      YEAR >= 2015 & YEAR <= 2019 ~ "2015-2019",
      YEAR >= 2020 & YEAR <= 2023 ~ "2020-2023"
    )
  )

# Summarize average extremes per 5-year bin per city
city_5yr_summary <- annual_extremes %>%
  group_by(city, five_year_bin) %>%
  summarise(
    avg_heatwave_days = mean(heatwave_days, na.rm = TRUE),
    avg_extreme_rain_days = mean(extreme_rain_days, na.rm = TRUE)
  ) %>%
  ungroup()

# Save 5-year summary to CSV
write_csv(city_5yr_summary, "city_5yr_summary.csv")




#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#ANALYSIS
#DESCRIPTIVE

library(dplyr)
library(ggplot2)
library(readr)

# Load annual extremes
annual_extremes <- read_csv("annual_extremes.csv", show_col_types = FALSE)

# Quick look
head(annual_extremes)
summary(annual_extremes)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#LINEAR REGRESSION
library(dplyr)
library(broom)

trend_results <- list()
cities <- unique(annual_extremes$city)

for (city_name in cities) {
  city_data <- annual_extremes %>% filter(city == city_name)
  
  # Ensure YEAR is numeric
  city_data <- city_data %>% mutate(YEAR = as.numeric(YEAR))
  
  # Only run regression if variable has variation
  if (var(city_data$heatwave_days, na.rm = TRUE) > 0) {
    lm_heat <- lm(heatwave_days ~ YEAR, data = city_data)
    heat_res <- broom::tidy(lm_heat)
  } else {
    heat_res <- tibble(term = c("(Intercept)", "YEAR"), estimate = NA, std.error = NA, statistic = NA, p.value = NA)
  }
  
  if (var(city_data$extreme_rain_days, na.rm = TRUE) > 0) {
    lm_rain <- lm(extreme_rain_days ~ YEAR, data = city_data)
    rain_res <- broom::tidy(lm_rain)
  } else {
    rain_res <- tibble(term = c("(Intercept)", "YEAR"), estimate = NA, std.error = NA, statistic = NA, p.value = NA)
  }
  
  trend_results[[city_name]] <- list(
    heatwave = heat_res,
    rain = rain_res
  )
}

# Example: view Abuja heatwave trend
trend_results[["Abuja"]][["heatwave"]]





#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Flattening the list and saving it in CSV
library(dplyr)
library(tidyr)
library(readr)

# Combine all cities and variables into one table
all_trends <- bind_rows(
  lapply(names(trend_results), function(city_name) {
    
    # Heatwave regression table
    hw <- trend_results[[city_name]][["heatwave"]] %>%
      mutate(variable = "heatwave_days", city = city_name)
    
    # Extreme rain regression table
    rn <- trend_results[[city_name]][["rain"]] %>%
      mutate(variable = "extreme_rain_days", city = city_name)
    
    # Combine both for this city
    bind_rows(hw, rn)
  })
)

# Reorder columns for clarity
all_trends <- all_trends %>%
  select(city, variable, term, estimate, std.error, statistic, p.value)

# Save to CSV
write_csv(all_trends, "trend_analysis_results.csv")

# Preview
head(all_trends)



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

library(dplyr)
library(readr)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Comparison of the south and north
# ----------------------------
# 1. CITY-LEVEL TRENDS
# ----------------------------

# annual_extremes already has:
# city, YEAR, heatwave_days, extreme_rain_days

city_trends <- annual_extremes %>%
  group_by(city, YEAR) %>%
  summarise(
    heatwave_days = sum(heatwave_days, na.rm = TRUE),
    extreme_rain_days = sum(extreme_rain_days, na.rm = TRUE),
    .groups = "drop"
  )

# Save city-level trends for Datawrapper
write_csv(city_trends, "city_trends.csv")




#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# ----------------------------
# 2. NORTH VS SOUTH COMPARISON
# ----------------------------

# Define regions
north_cities <- c("Abuja", "Kano", "Maiduguri", "Kaduna")
south_cities <- c("Lagos", "Port Harcourt", "Ibadan", "Enugu")

# Add a new column for region
north_south_trends <- city_trends %>%
  mutate(region = case_when(
    city %in% north_cities ~ "North",
    city %in% south_cities ~ "South",
    TRUE ~ "Other"
  )) %>%
  group_by(region, YEAR) %>%
  summarise(
    avg_heatwave_days = mean(heatwave_days, na.rm = TRUE),
    avg_extreme_rain_days = mean(extreme_rain_days, na.rm = TRUE),
    .groups = "drop"
  )

# Save north-south comparison
write_csv(north_south_trends, "north_south_trends.csv")



#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
library(dplyr)
library(readr)

# Load your annual extremes data
annual_extremes <- read_csv("annual_extremes.csv")

# Create bins for baseline (2000–2004) and recent (2020–2023)
compare_df <- annual_extremes %>%
  mutate(period = case_when(
    YEAR >= 2000 & YEAR <= 2004 ~ "2000_2004",
    YEAR >= 2020 & YEAR <= 2023 ~ "2020_2023",
    TRUE ~ NA_character_
  )) %>%
  filter(!is.na(period)) %>%  # keep only those years
  group_by(city, period) %>%
  summarise(
    avg_heatwave_days = mean(heatwave_days, na.rm = TRUE),
    avg_extreme_rain_days = mean(extreme_rain_days, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  tidyr::pivot_wider(
    names_from = period,
    values_from = c(avg_heatwave_days, avg_extreme_rain_days)
  ) %>%
  mutate(
    heatwave_change = avg_heatwave_days_2020_2023 - avg_heatwave_days_2000_2004,
    rain_change = avg_extreme_rain_days_2020_2023 - avg_extreme_rain_days_2000_2004,
    heatwave_pct_change = 100 * heatwave_change / avg_heatwave_days_2000_2004,
    rain_pct_change = 100 * rain_change / avg_extreme_rain_days_2000_2004
  )

# Save to CSV
write_csv(compare_df, "compare_2000_2004_vs_2020_2023.csv")

# Preview
print(compare_df)
