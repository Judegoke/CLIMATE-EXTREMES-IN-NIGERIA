Climate Extremes in Nigerian Cities (2000–2023): Trends, Patterns, and Recommendations

This analysis quantifies changes in two climate extremes — heatwave days and extreme precipitation days — across eight Nigerian cities: Lagos, Port Harcourt, Enugu, Kaduna, Abuja (FCT), Maiduguri, Kano, and Jos between 2000 and 2023.

Methodology (brief):

Data Collection: Daily climate data retrieved from NASA POWER using R (nasapower package).

Processing in R:
• Heatwave day = T2M_MAX ≥ 35 °C
• Extreme rain day = PRECTOTCORR ≥ 50 mm/day

Computation: Annual totals aggregated into 5-year bins for clearer trends.

Regression: Linear regression models applied in R to estimate long-term change.

Visualization: Interactive dashboards built in Tableau (maps, time-series, bar comparisons, regression plots).

Key Findings:

Maiduguri and Kano recorded the highest burden of heatwave days (often exceeding 150–200 days on 5-year averages).

Lagos and Port Harcourt showed fewer heatwaves but significantly higher extreme rainfall days.

Kaduna experienced a sharp increase in rainfall extremes in 2020–2023.

Regression results confirm upward heatwave trends in northern cities, while southern/coastal cities show rainfall-driven risks.

Recommendations:

Develop urban heat management strategies for Maiduguri and Kano, where prolonged heat periods are intensifying.

Strengthen stormwater and flood management infrastructure in cities such as Lagos, Port Harcourt, and Kaduna.

Establish routine monitoring systems that combine satellite and ground-station data for better validation.

Encourage integration of climate risk dashboards into state-level planning and policy decisions.

Conclusion:

This project demonstrates how open climate data, R-based analysis, and Tableau dashboards can provide actionable, city-level insights into Nigeria’s changing climate extremes. It also shows a reproducible framework that can support planning, research, and adaptation strategies at the municipal scale.
