# server.R
library(dplyr)
library(shiny)
library(rsconnect)

df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE)


