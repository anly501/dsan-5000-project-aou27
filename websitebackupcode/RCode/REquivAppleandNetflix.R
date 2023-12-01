knitr::opts_chunk$set(echo = TRUE)
library("tidyverse")
library("dplyr")
library("tibble")

setwd("C:/Users/Amand/OneDrive/Documents/DSAN 5000/website-template/HW1_5000/dsan-5000-project-aou27/websitedata")
apple_Dfr <- read_csv("appletopsongsinternational2023.csv")
apple_Tibble <- as_tibble(apple_Dfr)

apple_Tibble <- apple_Tibble %>%
  pivot_longer(cols = c(-"Pos", -"P+", -"Artist and Title", -"Days",
                        -"Pk", -"(x?)", -"Pts", -"Pts+", -"TPts"), names_to = "country", values_to = "country_rank")

apple_Tibble <- apple_Tibble %>%
  select(-"P+", -"Pts+", -"TPts")

colnames(apple_Tibble) <- c("Chart Position", "Artist and Title", "Position Duration", 
                            "Peak", "(x?)", "Points", "Country", "Country Rank")

apple_Tibble$"(x?)" <- gsub("[^0-9]", "", apple_Tibble$"(x?)")

apple_Tibble<- na.omit(apple_Tibble)

#-----------------------------------------------------------------------

#print(sum(is.na(apple_Tibble))) #check missing values
dim(apple_Tibble)
head(apple_Tibble)
#write.csv(apple_Tibble, "apple_R.csv")

setwd("C:/Users/Amand/OneDrive/Documents/DSAN 5000/website-template/HW1_5000/dsan-5000-project-aou27/websitedata")
spotify_Dfr <- read_csv("Spotify.csv")
spotify_Tibble <- as_tibble(spotify_Dfr)

colnames(spotify_Tibble) <- c("Index", "Artist Name", "Valence", "Danceability", "Energy", "Loudness", "Speechiness", "Acousticness", "Liveness", "Tempo", "Track Name", "Album Name", "Album Release Year")

spotify_Tibble <- spotify_Tibble %>%
  select(c("Index", "Artist Name", "Valence", "Danceability", "Energy", "Loudness", "Speechiness", "Tempo", "Track Name", "Album Name", "Album Release Year"))

head(spotify_Tibble)
dim(spotify_Tibble)
#write.csv(spotify_Tibble, "spotify_R.csv")

#-------------------------------------------------------------------------

setwd("C:/Users/Amand/OneDrive/Documents/DSAN 5000/website-template/HW1_5000/dsan-5000-project-aou27/websitedata")
netflix_Dfr <- read_csv("netflixWorld2022.csv")
netflix_Tibble <- as_tibble(netflix_Dfr)

colnames(netflix_Tibble) <- c("Title", "Points")

netflix_Tibble <- netflix_Tibble[-c(1, 2), ]

#print(sum(is.na(netflix_Tibble))) for missing values
dim(netflix_Tibble)
head(netflix_Tibble)
#write.csv(netflix_Tibble, "netflix_R.csv")


#------------------------SPOTIFY CONSTRUCTION-----------------------------

library(Rspotify)
library(httr)
library(jsonlite)
library(spotifyr) 
# spotifyr is an R wrapper for pulling track audio features and other information from Spotify’s Web API in bulk. 

#client_id<- "a6a783d1a5764cf0b776d59f35d15011"
#client_secret<- "1cf42c7e14004488b7c06b3b7342b85c"

get_spotify_access_token(client_id = "a6a783d1a5764cf0b776d59f35d15011",
                         client_secret = "1cf42c7e14004488b7c06b3b7342b85c")

Sys.setenv(SPOTIFY_CLIENT_ID = "a6a783d1a5764cf0b776d59f35d15011")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "1cf42c7e14004488b7c06b3b7342b85c")

Doja_Cat <- get_artist_audio_features("Doja Cat")
Tate_McRae <- get_artist_audio_features("Tate McRae")
Drake <- get_artist_audio_features("Drake")
Olivia_Rodrigo <- get_artist_audio_features("Olivia Rodrigo")
Taylor_Swift <- get_artist_audio_features("Taylor Swift")


Doja_Cat_A <- data.frame(Doja_Cat$artist_name,Doja_Cat$valence,
                         Doja_Cat$danceability,Doja_Cat$energy,Doja_Cat$loudness,
                         Doja_Cat$speechiness,Doja_Cat$acousticness,Doja_Cat$liveness,
                         Doja_Cat$tempo,Doja_Cat$track_name, Doja_Cat$album_name,Doja_Cat$album_release_year)
colnames(Doja_Cat_A) <- c("artist_name","Valence","danceability","energy",
                          "loudness","speechiness","acousticness","liveness",
                          "tempo","track_name","album_name","album_release_year")

head(Doja_Cat_A)


Tate_McRae_A <- data.frame(Tate_McRae$artist_name,Tate_McRae$valence,
                           Tate_McRae$danceability,Tate_McRae$energy,Tate_McRae$loudness,
                           Tate_McRae$speechiness,Tate_McRae$acousticness,Tate_McRae$liveness,
                           Tate_McRae$tempo,Tate_McRae$track_name, Tate_McRae$album_name,Tate_McRae$album_release_year)
colnames(Tate_McRae_A) <- c("artist_name","Valence","danceability","energy",
                            "loudness","speechiness","acousticness","liveness",
                            "tempo","track_name","album_name","album_release_year")

head(Tate_McRae_A)


Drake_A <-data.frame(Drake$artist_name,Drake$valence,
                     Drake$danceability,Drake$energy,Drake$loudness,
                     Drake$speechiness,Drake$acousticness,Drake$liveness,
                     Drake$tempo,Drake$track_name, Drake$album_name,Drake$album_release_year)

colnames(Drake_A) <- c("artist_name","Valence","danceability","energy",
                       "loudness","speechiness","acousticness","liveness",
                       "tempo","track_name","album_name","album_release_year")
head(Drake_A)


Olivia_Rodrigo_A <-data.frame(Olivia_Rodrigo$artist_name,Olivia_Rodrigo$valence,
                              Olivia_Rodrigo$danceability,Olivia_Rodrigo$energy,Olivia_Rodrigo$loudness,
                              Olivia_Rodrigo$speechiness,Olivia_Rodrigo$acousticness,Olivia_Rodrigo$liveness,
                              Olivia_Rodrigo$tempo,Olivia_Rodrigo$track_name, Olivia_Rodrigo$album_name,Olivia_Rodrigo$album_release_year)

colnames(Olivia_Rodrigo_A) <- c("artist_name","Valence","danceability","energy",
                                "loudness","speechiness","acousticness","liveness",
                                "tempo","track_name","album_name","album_release_year")
head(Olivia_Rodrigo_A)


Taylor_Swift_A <- data.frame(Taylor_Swift$artist_name,Taylor_Swift$valence,
                             Taylor_Swift$danceability,Taylor_Swift$energy,Taylor_Swift$loudness,
                             Taylor_Swift$speechiness,Taylor_Swift$acousticness,Taylor_Swift$liveness,
                             Taylor_Swift$tempo,Taylor_Swift$track_name, Taylor_Swift$album_name,Taylor_Swift$album_release_year)
colnames(Taylor_Swift_A) <- c("artist_name","Valence","danceability","energy",
                              "loudness","speechiness","acousticness","liveness",
                              "tempo","track_name","album_name","album_release_year")

head(Taylor_Swift_A)


DC_Matrix<- as.matrix(Doja_Cat_A)
TM_Matrix<- as.matrix(Tate_McRae_A)
Drake_Matrix<- as.matrix(Drake_A)
OR_Matrix<- as.matrix(Olivia_Rodrigo_A)
TS_Matrix<- as.matrix(Taylor_Swift_A)



Spotify1 <-rbind(DC_Matrix,TM_Matrix, Drake_Matrix, OR_Matrix, TS_Matrix)
Spotify<- as.data.frame(Spotify1)
head(Spotify)
write.csv(Spotify, "Spotify.csv")
