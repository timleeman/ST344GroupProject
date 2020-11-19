# Folder: ST344GroupProject

### ~~Countries.xlsx~~
File has been removed, please use Continents.csv in the Data folder instead


### How-COVID-19-is-changing-consumer-behaviornow-and-forever.pdf

### setup.R
This script installs all of the packages and sets up all of the data we are using

It produces 3 important objects:

+ covidData: our copy of the tidycovid19 data, snapshot taken on 19/11/2020, with continent data added (in a tibble)
+ auravisionData: The auravision data set for lockdown dates, in a tibble
+ chosenCountries: The list of the countries we have chosen to analyse, in a character vector

You can get the data for just the chosen countries using `filter(covidData, country %in% chosenCountries)`


### ~~tidycovid19.csv~~
This is the (old) snapshot of the tidycovid19 package's dataset, as provided by the ST344 Moodle webpage.
We will no longer be using this dataset, as we are creating our own snapshot to use for our investigation.
