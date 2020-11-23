auravisionData <- read_csv("https://raw.github.com/timleeman/ST344GroupProject/main/LockdownDates/AuraVisionCleaned.csv")
countries <- read_csv("https://raw.github.com/timleeman/ST344GroupProject/main/Data/Continents.csv")
covidData <- read_csv("https://raw.github.com/timleeman/ST344GroupProject/main/Data/TidyCovid19DataSet.csv", guess_max = 10000)

countries <- filter(countries, country %in% covidData$country)
covidData <- left_join(covidData, countries, by = "country")
covidData <- mutate(covidData, country = factor(country), continent = factor(continent))
covidData$country <- as.factor(covidData$country)
#Getting just the relevant continents
covidData <- filter(covidData, continent == "Europe" | continent == "North America" | continent == "South America" | country == "Turkey")
co <- ""
#Remove countries with excessive amounts of data missing in gcmr_retail_recreation column
for (co in levels(covidData$country)){
  #100 can be changed to another threshold
  if(sum(is.na(filter(covidData, country == co)$gcmr_retail_recreation)) >= 100){
    covidData <- filter(covidData, country != co)
  }
}

#Remove countries with excessive amounts of data missing in gcmr_grocery_pharmacy column
for (co in levels(covidData$country)){
  #100 can be changed to another threshold
  if(sum(is.na(filter(covidData, country == co)$gcmr_grocery_pharmacy)) >= 100){
    covidData <- filter(covidData, country != co)
  }
}
#Getting rid of countries with populations less than 1,000,000
covidData <- filter(covidData, population > 1000000)
covidData <- droplevels(covidData)
chosenCountries <- levels(covidData$country)
covidData <- read_csv("https://raw.github.com/timleeman/ST344GroupProject/main/Data/TidyCovid19DataSet.csv", guess_max = 10000)
countries <- filter(countries, country %in% covidData$country)
covidData <- left_join(covidData, countries, by = "country")
covidData <- mutate(covidData, country = factor(country), continent = factor(continent))
