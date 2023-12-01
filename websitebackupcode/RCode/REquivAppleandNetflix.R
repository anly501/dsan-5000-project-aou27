knit::opts_chunk$set(echo=TRUE)
library(tidyverse)
library(dplyr)
library(tibble)

apple_Dfr<- read.csv("C:/Users/Amand/OneDrive/Documents/DSAN 5000/website-template/HW1_5000/dsan-5000-project-aou27/websitedata/appletopsongsinternational2023.csv")
apple_Tibble <- as_tibble(apple_Dfr)
print(apple_Tibble)
apple_Tibble <- apple_Tibble %>%
  pivot_longer(cols = c(-"Pos", -"P+", -"Artist and Title", -"Days",
                        -"Pk", -"(x?)", -"Pts", -"Pts+", -"TPts"), names_to = "country", values_to = "country_rank")

apple_Tibble <- apple_Tibble %>%
  select(-"P+", -"(x?)", -"Pts+", -"TPts")

colnames(apple_Tibble) <- c("Chart Position", "Artist and Title", "Position Duration", 
                            "Peak", "Points", "Country", "Country Rank") 

print(sum(is.na(apple_Tibble))) 
dim(apple_Tibble)
head(apple_Tibble)

