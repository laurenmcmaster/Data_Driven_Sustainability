# Data-Driven Sustainability: Insights from Environmental Data

## Introduction

In an era where environmental awareness is becoming more prominent, along with a need for sustainable energy solutions, I explore the intricate landscape of renewable energy production. Leveraging structured data and SQL-based analysis, my goal is to decipher historical trends in renewable energy sources, variations in these sources by region, and whether this has had an effect on CO2 emissions globally. With a commitment to mitigating the impacts of climate change, this project aspires to equip stakeholders with insights that contribute to informed decisions and foster a cleaner, more environmentally responsible future.

## Key questions

1. **Renewable Energy Trends**
    1. How have historical trends in renewable energy production, including growth rates, varied for different renewable sources (e.g., solar, wind, hydro)?
    2. Which renewable sources have experienced the most significant growth over time?
2. **Renewable Energy Mix Analysis:**
    - How has the composition of the renewable energy mix, including solar, wind, and hydro, evolved in different regions or countries over time?
3. **Regional Comparisons**:
    - What are the differences in renewable energy production and consumption across various regions or countries, with a specific focus on solar, wind, and hydro energy sources?
    - What factors underlie the variations in the adoption of these renewable energy sources among different regions or countries?
4. **Air Pollution and Renewable Energy Impact Analysis**
    - Is there a correlation between air pollution levels and the generation of renewable energy from solar, wind, and hydro sources?

## Data Collection:

Data was collected from three Kaggle datasets listed below:

- [CO2 Emissions](https://www.kaggle.com/datasets/ulrikthygepedersen/co2-emissions-by-country)
- [Renewable Energy](https://www.kaggle.com/datasets/belayethossainds/renewable-energy-world-wide-19652022?select=02+modern-renewable-energy-consumption.csv)

## Database creation and analysis
SQL files regarding database creation and analysis are located at Database_Setup.sql and Analysis.sql in the repository.

## Tableau visualization - <a href="https://public.tableau.com/views/RenewableEnergyProject_16994785120460/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link">here</a>
I created an interactive Tableau dashboard for this project to visualize trends in each renewable energy source.
<img align="center" src="images/Energy_Tableau.png">

## Results and Interpretation

Solar energy production has experienced substantial growth rates, characterized by noticeable spikes starting in 2014. Wind energy production has similarly demonstrated significant expansion, beginning in 2009. Meanwhile, hydro energy production has maintained relative stability, albeit with occasional fluctuations, which may be attributed to variations in weather patterns and water resources.

The rapid adoption of solar energy can be attributed to various factors, including decreasing costs, technological advancements, and an escalating awareness of environmental concerns. In regions with abundant sunlight, solar energy has seen widespread adoption, resulting in a considerable share of solar energy within their renewable energy mix. Wind energy has become a substantial component in regions where favorable wind conditions prevail. Moreover, hydro energy plays a prominent role in nations endowed with substantial water resources.

The analysis of recent years reveals a slight decrease in CO2 emissions alongside renewable energy generation. Regions or countries grappling with higher levels of air pollution tend to exhibit a greater inclination toward the adoption of renewable energy sources. This inclination may stem from environmental concerns and regulatory pressures, indicating a potential correlation between increased air pollution and a heightened demand for cleaner and more sustainable energy sources.

## Conclusion

This analysis underscores the dynamic evolution of renewable energy trends and their connection to environmental considerations. The robust growth of solar and wind energy demonstrates the transformative power of technological advancements and environmental consciousness. Hydro energy's stability, halted by occasional fluctuations attributed to natural forces, reaffirms its role in the global renewable energy landscape. 

Simultaneously, the slight reduction in CO2 emissions alongside the expansion of renewable energy illustrates the benefits of cleaner energy solutions. Moreover, the correlation between heightened air pollution and increased adoption of renewables highlights the role of environmental awareness and regulations in driving sustainable energy choices. As the world moves toward a more sustainable and environmentally responsible future, these insights serve as a guiding compass for a greener and cleaner energy landscape.







