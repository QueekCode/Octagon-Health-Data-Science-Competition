## COPYRIGHT 2021, Octagoons, All Rights Reserved

## Authors: Kevin Schubert, Zoila Rossi, Amber Jolly, Gavincko Alagesan

## Usage of this script academically and professionally must be granted
## permission by all authors.

library(lubridate)
df = NA
tmp = NA
for (name in list.files('./data/permutation1')){
  tmp = read.csv(paste("data/permutation1/", name, sep = ''))
  tmp$time..s. = hms(substr(tmp$time..s., 12, 19))
  tmp$day = strtoi(strsplit(strsplit(name, 'D')[[1]][2], '[.]')[[1]][1]) #day
  tmp$session = strtoi(substr(strsplit(name, 'D')[[1]][1], 2, 3)) # session
  tmp$permutation = 1
  if (tmp$day == 2){
    tmp$immediate_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("10:00:00") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("16:00:00") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
    tmp$recent_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("14:59:59") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("22:59:59") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
  } else {
    tmp$immediate_action = "Nothing"
    tmp$recent_action = "Nothing"
  }
  
  if (is.na(df)){
    df = tmp
  } else {
    df = rbind(df, tmp)
  }
}
for (name in list.files('./data/permutation2')){
  tmp = read.csv(paste("data/permutation2/", name, sep = ''))
  tmp$time..s. = hms(substr(tmp$time..s., 12, 19))
  tmp$day = strtoi(strsplit(strsplit(name, 'D')[[1]][2], '[.]')[[1]][1]) #day
  tmp$session = strtoi(substr(strsplit(name, 'D')[[1]][1], 2, 3)) # session
  tmp$permutation = 2
  if (tmp$day == 2){
    tmp$immediate_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("10:00:00") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("16:00:00") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
    tmp$recent_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("14:59:59") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("22:59:59") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
  } else {
    tmp$immediate_action = "Nothing"
    tmp$recent_action = "Nothing"
  }
  
  if (is.na(df)){
    df = tmp
  } else {
    df = rbind(df, tmp)
  }
}

for (name in list.files('./data/permutation3')){
  tmp = read.csv(paste("data/permutation3/", name, sep = ''))
  tmp$time..s. = hms(substr(tmp$time..s., 12, 19))
  tmp$day = strtoi(strsplit(strsplit(name, 'D')[[1]][2], '[.]')[[1]][1]) #day
  tmp$session = strtoi(substr(strsplit(name, 'D')[[1]][1], 2, 3)) # session
  tmp$permutation = 3
  if (tmp$day == 2){
    tmp$immediate_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("10:00:00") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("16:00:00") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
    tmp$recent_action = ifelse(
      hms("09:00:00") <= tmp$time..s. & 
        hms("14:59:59") >= tmp$time..s. ,
      "Reading",
      
      ifelse(
        hms("15:00:00") <= tmp$time..s. & 
          hms("22:59:59") >= tmp$time..s. ,
        "Aerobic Exercise",
        
        ifelse(
          hms("23:00:00") <= tmp$time..s. & 
            hms("23:59:59") >= tmp$time..s. ,
          "Sugar",
          "Nothing"
        )
      )
    )
    
  } else {
    tmp$immediate_action = "Nothing"
    tmp$recent_action = "Nothing"
  }
  
  if (is.na(df)){
    df = tmp
  } else {
    df = rbind(df, tmp)
  }
}


################### manual IR inclusion
df$IR = NA

df$IR[df$session == 2 & df$day == 1] = 102
df$IR[df$session == 2 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 69
df$IR[df$session == 2 & df$day == 3] = 91

df$IR[df$session == 3 & df$day == 1] = 113
df$IR[df$session == 3 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 113
df$IR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 3 & df$day == 3] = 69

df$IR[df$session == 4 & df$day == 1] = 102
df$IR[df$session == 4 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 4 & df$day == 3] = 91

df$IR[df$session == 5 & df$day == 1] = 83
df$IR[df$session == 5 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$IR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 5 & df$day == 3] = 91

df$IR[df$session == 6 & df$day == 1] = 91
df$IR[df$session == 6 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 69
df$IR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 6 & df$day == 3] = 91

df$IR[df$session == 7 & df$day == 1] = 102
df$IR[df$session == 7 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 7 & df$day == 3] = 102

df$IR[df$session == 8 & df$day == 1] = 91
df$IR[df$session == 8 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 102
df$IR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 80
df$IR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 69
df$IR[df$session == 8 & df$day == 3] = 80

df$IR[df$session == 9 & df$day == 1] = 80
df$IR[df$session == 9 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 9 & df$day == 3] = 102

df$IR[df$session == 10 & df$day == 1] = 91
df$IR[df$session == 10 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 102
df$IR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 80
df$IR[df$session == 10 & df$day == 3] = 113

df$IR[df$session == 11 & df$day == 1] = 102
df$IR[df$session == 11 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 83
df$IR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 80
df$IR[df$session == 11 & df$day == 3] = 113

df$IR[df$session == 12 & df$day == 1] = 113
df$IR[df$session == 12 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 113
df$IR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 102
df$IR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 58
df$IR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 12 & df$day == 3] = 102

df$IR[df$session == 13 & df$day == 1] = 80
df$IR[df$session == 13 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 91
df$IR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 13 & df$day == 3] = 91

df$IR[df$session == 14 & df$day == 1] = 80
df$IR[df$session == 14 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 58
df$IR[df$session == 14 & df$day == 3] = 91

df$IR[df$session == 15 & df$day == 1] = 102
df$IR[df$session == 15 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 80
df$IR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 15 & df$day == 3] = 69

df$IR[df$session == 16 & df$day == 1] = 102
df$IR[df$session == 16 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 80
df$IR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 16 & df$day == 3] = 69


df$IR[df$session == 17 & df$day == 1] = 91
df$IR[df$session == 17 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 80
df$IR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 113
df$IR[df$session == 17 & df$day == 3] = 91

df$IR[df$session == 18 & df$day == 1] = 91
df$IR[df$session == 18 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 80
df$IR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 36
df$IR[df$session == 18 & df$day == 3] = 58

df$IR[df$session == 19 & df$day == 1] = 80
df$IR[df$session == 19 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 80
df$IR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 69
df$IR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 19 & df$day == 3] = 91

df$IR[df$session == 20 & df$day == 1] = 104
df$IR[df$session == 20 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 104
df$IR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 80
df$IR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 69
df$IR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 20 & df$day == 3] = 69

df$IR[df$session == 21 & df$day == 1] = 80
df$IR[df$session == 21 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 113
df$IR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 58
df$IR[df$session == 21 & df$day == 3] = 80

df$IR[df$session == 22 & df$day == 1] = 102
df$IR[df$session == 22 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 102
df$IR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 80
df$IR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 22 & df$day == 3] = 102

df$IR[df$session == 23 & df$day == 1] = 102
df$IR[df$session == 23 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 80
df$IR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 80
df$IR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 80
df$IR[df$session == 23 & df$day == 3] = NA

df$IR[df$session == 24 & df$day == 1] = 113
df$IR[df$session == 24 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 113
df$IR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 102
df$IR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 69
df$IR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 24 & df$day == 3] = 91

df$IR[df$session == 25 & df$day == 1] = 80
df$IR[df$session == 25 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 113
df$IR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 25 & df$day == 3] = 102


df$IR[df$session == 26 & df$day == 1] = 91
df$IR[df$session == 26 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$IR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 91
df$IR[df$session == 26 & df$day == 3] = 102


df$IR[df$session == 27 & df$day == 1] = 102
df$IR[df$session == 27 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 69
df$IR[df$session == 27 & df$day == 3] = 80

df$IR[df$session == 28 & df$day == 1] = 80
df$IR[df$session == 28 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 80
df$IR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 91
df$IR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 102
df$IR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 58
df$IR[df$session == 28 & df$day == 3] = 102

df$IR[df$session == 29 & df$day == 1] = 102
df$IR[df$session == 29 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 102
df$IR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 69
df$IR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 113
df$IR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 102
df$IR[df$session == 29 & df$day == 3] = 102

################### manual DR inclusion
df$DR = NA

df$DR[df$session == 2 & df$day == 1] = 62
df$DR[df$session == 2 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 62
df$DR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 52
df$DR[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 2 & df$day == 3] = 62

df$DR[df$session == 3 & df$day == 1] = 93
df$DR[df$session == 3 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 93
df$DR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 3 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 114
df$DR[df$session == 3 & df$day == 3] = 114

df$DR[df$session == 4 & df$day == 1] = 73
df$DR[df$session == 4 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 4 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 62
df$DR[df$session == 4 & df$day == 3] = 93

df$DR[df$session == 5 & df$day == 1] = 69
df$DR[df$session == 5 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 69
df$DR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 114
df$DR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 5 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 52
df$DR[df$session == 5 & df$day == 3] = 93

df$DR[df$session == 6 & df$day == 1] = 83
df$DR[df$session == 6 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$DR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 62
df$DR[df$session == 6 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 93
df$DR[df$session == 6 & df$day == 3] = 83

df$DR[df$session == 7 & df$day == 1] = 73
df$DR[df$session == 7 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 52
df$DR[df$session == 7 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 7 & df$day == 3] = 73

df$DR[df$session == 8 & df$day == 1] = 73
df$DR[df$session == 8 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 62
df$DR[df$session == 8 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 8 & df$day == 3] = 41

df$DR[df$session == 9 & df$day == 1] = 93
df$DR[df$session == 9 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 93
df$DR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 73
df$DR[df$session == 9 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 83
df$DR[df$session == 9 & df$day == 3] = 104

df$DR[df$session == 10 & df$day == 1] = 93
df$DR[df$session == 10 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 93
df$DR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 83
df$DR[df$session == 10 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 52
df$DR[df$session == 10 & df$day == 3] = 93

df$DR[df$session == 11 & df$day == 1] = 93
df$DR[df$session == 11 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 93
df$DR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 104
df$DR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 113
df$DR[df$session == 11 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 62
df$DR[df$session == 11 & df$day == 3] = 104

df$DR[df$session == 12 & df$day == 1] = 104
df$DR[df$session == 12 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 104
df$DR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 12 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 12 & df$day == 3] = 93

df$DR[df$session == 13 & df$day == 1] = 83
df$DR[df$session == 13 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$DR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 114
df$DR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 52
df$DR[df$session == 13 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 93
df$DR[df$session == 13 & df$day == 3] = 93

df$DR[df$session == 14 & df$day == 1] = 104
df$DR[df$session == 14 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 104
df$DR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 62
df$DR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 62
df$DR[df$session == 14 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 93
df$DR[df$session == 14 & df$day == 3] = 83

df$DR[df$session == 15 & df$day == 1] = 83
df$DR[df$session == 15 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$DR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 52
df$DR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 83
df$DR[df$session == 15 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 83
df$DR[df$session == 15 & df$day == 3] = 83

df$DR[df$session == 16 & df$day == 1] = 52
df$DR[df$session == 16 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 52
df$DR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 93
df$DR[df$session == 16 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 41
df$DR[df$session == 16 & df$day == 3] = 73


df$DR[df$session == 17 & df$day == 1] = 114
df$DR[df$session == 17 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 114
df$DR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 62
df$DR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 62
df$DR[df$session == 17 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 93
df$DR[df$session == 17 & df$day == 3] = 83

df$DR[df$session == 18 & df$day == 1] = 73
df$DR[df$session == 18 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 73
df$DR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 83
df$DR[df$session == 18 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 52
df$DR[df$session == 18 & df$day == 3] = 104

df$DR[df$session == 19 & df$day == 1] = 73
df$DR[df$session == 19 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 114
df$DR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 93
df$DR[df$session == 19 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 104
df$DR[df$session == 19 & df$day == 3] = 73

df$DR[df$session == 20 & df$day == 1] = 91
df$DR[df$session == 20 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 91
df$DR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 52
df$DR[df$session == 20 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 104
df$DR[df$session == 20 & df$day == 3] = 104

df$DR[df$session == 21 & df$day == 1] = 83
df$DR[df$session == 21 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$DR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 73
df$DR[df$session == 21 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 62
df$DR[df$session == 21 & df$day == 3] = 83

df$DR[df$session == 22 & df$day == 1] = 114
df$DR[df$session == 22 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 114
df$DR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 93
df$DR[df$session == 22 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 114
df$DR[df$session == 22 & df$day == 3] = 93

df$DR[df$session == 23 & df$day == 1] = 73
df$DR[df$session == 23 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 73
df$DR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 41
df$DR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 62
df$DR[df$session == 23 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 83
df$DR[df$session == 23 & df$day == 3] = NA

df$DR[df$session == 24 & df$day == 1] = 114
df$DR[df$session == 24 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 114
df$DR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 73
df$DR[df$session == 24 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 52
df$DR[df$session == 24 & df$day == 3] = 73

df$DR[df$session == 25 & df$day == 1] = 104
df$DR[df$session == 25 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 104
df$DR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 93
df$DR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 25 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 104
df$DR[df$session == 25 & df$day == 3] = 104

df$DR[df$session == 26 & df$day == 1] = 83
df$DR[df$session == 26 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 83
df$DR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 26 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 93
df$DR[df$session == 26 & df$day == 3] = 73

df$DR[df$session == 27 & df$day == 1] = 114
df$DR[df$session == 27 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 114
df$DR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 83
df$DR[df$session == 27 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 27 & df$day == 3] = 52

df$DR[df$session == 28 & df$day == 1] = 52
df$DR[df$session == 28 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 52
df$DR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 83
df$DR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 104
df$DR[df$session == 28 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 52
df$DR[df$session == 28 & df$day == 3] = 104

df$DR[df$session == 29 & df$day == 1] = 104
df$DR[df$session == 29 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 104
df$DR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 104
df$DR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 73
df$DR[df$session == 29 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 73
df$DR[df$session == 29 & df$day == 3] = 104


################### manual stroop inclusion
df$stroop = NA

df$stroop[df$session == 2 & df$day == 1] = 126
df$stroop[df$session == 2 & df$day == 2 
      & df$time..s. < hms("09:00:00")] = 126
df$stroop[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("09:00:00")
      & df$time..s. < hms("15:00:00")] = 126
df$stroop[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("15:00:00")
      & df$time..s. < hms("23:00:00")] = 126
df$stroop[df$session == 2 & df$day == 2 
      & df$time..s. >= hms("23:00:00")] = 128
df$stroop[df$session == 2 & df$day == 3] = 96

df$stroop[df$session == 3 & df$day == 1] = 119
df$stroop[df$session == 3 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 119
df$stroop[df$session == 3 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 120
df$stroop[df$session == 3 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 126
df$stroop[df$session == 3 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 117
df$stroop[df$session == 3 & df$day == 3] = 124

df$stroop[df$session == 4 & df$day == 1] = 113
df$stroop[df$session == 4 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 113
df$stroop[df$session == 4 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 120
df$stroop[df$session == 4 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 116
df$stroop[df$session == 4 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 119
df$stroop[df$session == 4 & df$day == 3] = 100

df$stroop[df$session == 5 & df$day == 1] = 112
df$stroop[df$session == 5 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 112
df$stroop[df$session == 5 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 115
df$stroop[df$session == 5 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 106
df$stroop[df$session == 5 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 114
df$stroop[df$session == 5 & df$day == 3] = 129

df$stroop[df$session == 6 & df$day == 1] = 119
df$stroop[df$session == 6 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 119
df$stroop[df$session == 6 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 106
df$stroop[df$session == 6 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 102
df$stroop[df$session == 6 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 116
df$stroop[df$session == 6 & df$day == 3] = 109

df$stroop[df$session == 7 & df$day == 1] = 110
df$stroop[df$session == 7 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 110
df$stroop[df$session == 7 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 131
df$stroop[df$session == 7 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 124
df$stroop[df$session == 7 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 120
df$stroop[df$session == 7 & df$day == 3] = 114

df$stroop[df$session == 8 & df$day == 1] = 112
df$stroop[df$session == 8 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 112
df$stroop[df$session == 8 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 125
df$stroop[df$session == 8 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 109
df$stroop[df$session == 8 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 117
df$stroop[df$session == 8 & df$day == 3] = 122

df$stroop[df$session == 9 & df$day == 1] = 124
df$stroop[df$session == 9 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 124
df$stroop[df$session == 9 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 118
df$stroop[df$session == 9 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 114
df$stroop[df$session == 9 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 126
df$stroop[df$session == 9 & df$day == 3] = 119

df$stroop[df$session == 10 & df$day == 1] = 109
df$stroop[df$session == 10 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 109
df$stroop[df$session == 10 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 119
df$stroop[df$session == 10 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 129
df$stroop[df$session == 10 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 133
df$stroop[df$session == 10 & df$day == 3] = 116

df$stroop[df$session == 11 & df$day == 1] = 127
df$stroop[df$session == 11 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 127
df$stroop[df$session == 11 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 125
df$stroop[df$session == 11 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 120
df$stroop[df$session == 11 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 129
df$stroop[df$session == 11 & df$day == 3] = 126

df$stroop[df$session == 12 & df$day == 1] = 121
df$stroop[df$session == 12 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 121
df$stroop[df$session == 12 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 110
df$stroop[df$session == 12 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 113
df$stroop[df$session == 12 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 124
df$stroop[df$session == 12 & df$day == 3] = 114

df$stroop[df$session == 13 & df$day == 1] = 119
df$stroop[df$session == 13 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 119
df$stroop[df$session == 13 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 87
df$stroop[df$session == 13 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 117
df$stroop[df$session == 13 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 116
df$stroop[df$session == 13 & df$day == 3] = 118

df$stroop[df$session == 14 & df$day == 1] = 122
df$stroop[df$session == 14 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 122
df$stroop[df$session == 14 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 118
df$stroop[df$session == 14 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 120
df$stroop[df$session == 14 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 127
df$stroop[df$session == 14 & df$day == 3] = 113

df$stroop[df$session == 15 & df$day == 1] = 111
df$stroop[df$session == 15 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 111
df$stroop[df$session == 15 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 123
df$stroop[df$session == 15 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 118
df$stroop[df$session == 15 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 124
df$stroop[df$session == 15 & df$day == 3] = 120

df$stroop[df$session == 16 & df$day == 1] = 118
df$stroop[df$session == 16 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 118
df$stroop[df$session == 16 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 118
df$stroop[df$session == 16 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 116
df$stroop[df$session == 16 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 113
df$stroop[df$session == 16 & df$day == 3] = 117

df$stroop[df$session == 17 & df$day == 1] = 114
df$stroop[df$session == 17 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 114
df$stroop[df$session == 17 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 124
df$stroop[df$session == 17 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 109
df$stroop[df$session == 17 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 129
df$stroop[df$session == 17 & df$day == 3] = 102

df$stroop[df$session == 18 & df$day == 1] = 119
df$stroop[df$session == 18 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 119
df$stroop[df$session == 18 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 129
df$stroop[df$session == 18 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 110
df$stroop[df$session == 18 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 117
df$stroop[df$session == 18 & df$day == 3] = 123

df$stroop[df$session == 19 & df$day == 1] = 128
df$stroop[df$session == 19 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 128
df$stroop[df$session == 19 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 122
df$stroop[df$session == 19 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 120
df$stroop[df$session == 19 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 108
df$stroop[df$session == 19 & df$day == 3] = 119

df$stroop[df$session == 20 & df$day == 1] = 114
df$stroop[df$session == 20 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 114
df$stroop[df$session == 20 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 118
df$stroop[df$session == 20 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 119
df$stroop[df$session == 20 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 121
df$stroop[df$session == 20 & df$day == 3] = 121

df$stroop[df$session == 21 & df$day == 1] = 133
df$stroop[df$session == 21 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 133
df$stroop[df$session == 21 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 118
df$stroop[df$session == 21 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 125
df$stroop[df$session == 21 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 115
df$stroop[df$session == 21 & df$day == 3] = 113

df$stroop[df$session == 22 & df$day == 1] = 132
df$stroop[df$session == 22 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 132
df$stroop[df$session == 22 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 112
df$stroop[df$session == 22 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 102
df$stroop[df$session == 22 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 125
df$stroop[df$session == 22 & df$day == 3] = 124

df$stroop[df$session == 23 & df$day == 1] = 113
df$stroop[df$session == 23 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 113
df$stroop[df$session == 23 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 120
df$stroop[df$session == 23 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 123
df$stroop[df$session == 23 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 122
df$stroop[df$session == 23 & df$day == 3] = NA

df$stroop[df$session == 24 & df$day == 1] = 116
df$stroop[df$session == 24 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 116
df$stroop[df$session == 24 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 116
df$stroop[df$session == 24 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 120
df$stroop[df$session == 24 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 122
df$stroop[df$session == 24 & df$day == 3] = 119

df$stroop[df$session == 25 & df$day == 1] = 119
df$stroop[df$session == 25 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 119
df$stroop[df$session == 25 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 117
df$stroop[df$session == 25 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 108
df$stroop[df$session == 25 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 110
df$stroop[df$session == 25 & df$day == 3] = 131

df$stroop[df$session == 26 & df$day == 1] = 110
df$stroop[df$session == 26 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 110
df$stroop[df$session == 26 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 115
df$stroop[df$session == 26 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 117
df$stroop[df$session == 26 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 124
df$stroop[df$session == 26 & df$day == 3] = 110

df$stroop[df$session == 27 & df$day == 1] = 106
df$stroop[df$session == 27 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 106
df$stroop[df$session == 27 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 114
df$stroop[df$session == 27 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 108
df$stroop[df$session == 27 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 124
df$stroop[df$session == 27 & df$day == 3] = 118

df$stroop[df$session == 28 & df$day == 1] = 117
df$stroop[df$session == 28 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 117
df$stroop[df$session == 28 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 122
df$stroop[df$session == 28 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 115
df$stroop[df$session == 28 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 110
df$stroop[df$session == 28 & df$day == 3] = 125

df$stroop[df$session == 29 & df$day == 1] = 123
df$stroop[df$session == 29 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 123
df$stroop[df$session == 29 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 120
df$stroop[df$session == 29 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 123
df$stroop[df$session == 29 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 127
df$stroop[df$session == 29 & df$day == 3] = 119


################### manual systolic BP inclusion
df$BPS = NA

df$BPS[df$session == 2 & df$day == 1] = 115
df$BPS[df$session == 2 & df$day == 2 
          & df$time..s. < hms("09:00:00")] = 115
df$BPS[df$session == 2 & df$day == 2 
          & df$time..s. >= hms("09:00:00")
          & df$time..s. < hms("15:00:00")] = 107
df$BPS[df$session == 2 & df$day == 2 
          & df$time..s. >= hms("15:00:00")
          & df$time..s. < hms("23:00:00")] = 74
df$BPS[df$session == 2 & df$day == 2 
          & df$time..s. >= hms("23:00:00")] = 110
df$BPS[df$session == 2 & df$day == 3] = 120

df$BPS[df$session == 3 & df$day == 1] = 115
df$BPS[df$session == 3 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 115
df$BPS[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 107
df$BPS[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 74
df$BPS[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 110
df$BPS[df$session == 3 & df$day == 3] = 120

df$BPS[df$session == 4 & df$day == 1] = 122
df$BPS[df$session == 4 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 122
df$BPS[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 109
df$BPS[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 107
df$BPS[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 114
df$BPS[df$session == 4 & df$day == 3] = 104

df$BPS[df$session == 5 & df$day == 1] = NA
df$BPS[df$session == 5 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = NA
df$BPS[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = NA
df$BPS[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = NA
df$BPS[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = NA
df$BPS[df$session == 5 & df$day == 3] = NA

df$BPS[df$session == 6 & df$day == 1] = 95
df$BPS[df$session == 6 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 95
df$BPS[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 59
df$BPS[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 110
df$BPS[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 103
df$BPS[df$session == 6 & df$day == 3] = 104

df$BPS[df$session == 7 & df$day == 1] = 132
df$BPS[df$session == 7 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 132
df$BPS[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 106
df$BPS[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 85
df$BPS[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 116
df$BPS[df$session == 7 & df$day == 3] = 117

df$BPS[df$session == 8 & df$day == 1] = 110
df$BPS[df$session == 8 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 110
df$BPS[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 116
df$BPS[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 88
df$BPS[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 114
df$BPS[df$session == 8 & df$day == 3] = 106

df$BPS[df$session == 9 & df$day == 1] = 121
df$BPS[df$session == 9 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 121
df$BPS[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 107
df$BPS[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 114
df$BPS[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 103
df$BPS[df$session == 9 & df$day == 3] = 105

df$BPS[df$session == 10 & df$day == 1] = 101
df$BPS[df$session == 10 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 101
df$BPS[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 130
df$BPS[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 103
df$BPS[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 136
df$BPS[df$session == 10 & df$day == 3] = 115

df$BPS[df$session == 11 & df$day == 1] = 96
df$BPS[df$session == 11 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 96
df$BPS[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 110
df$BPS[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 119
df$BPS[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 117
df$BPS[df$session == 11 & df$day == 3] = 104

df$BPS[df$session == 12 & df$day == 1] = 114
df$BPS[df$session == 12 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 114
df$BPS[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 128
df$BPS[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 131
df$BPS[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 121
df$BPS[df$session == 12 & df$day == 3] = 98

df$BPS[df$session == 13 & df$day == 1] = 132
df$BPS[df$session == 13 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 132
df$BPS[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 117
df$BPS[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 79
df$BPS[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 115
df$BPS[df$session == 13 & df$day == 3] = 126

df$BPS[df$session == 14 & df$day == 1] = 121
df$BPS[df$session == 14 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 121
df$BPS[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 118
df$BPS[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 93
df$BPS[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 106
df$BPS[df$session == 14 & df$day == 3] = 111

df$BPS[df$session == 15 & df$day == 1] = 93
df$BPS[df$session == 15 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 93
df$BPS[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 105
df$BPS[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 112
df$BPS[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 99
df$BPS[df$session == 15 & df$day == 3] = 102

df$BPS[df$session == 16 & df$day == 1] = 112
df$BPS[df$session == 16 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 112
df$BPS[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 107
df$BPS[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 84
df$BPS[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 104
df$BPS[df$session == 16 & df$day == 3] = 124

df$BPS[df$session == 17 & df$day == 1] = 116
df$BPS[df$session == 17 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 116
df$BPS[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 126
df$BPS[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 93
df$BPS[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 101
df$BPS[df$session == 17 & df$day == 3] = 116

df$BPS[df$session == 18 & df$day == 1] = 103
df$BPS[df$session == 18 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 103
df$BPS[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 130
df$BPS[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 110
df$BPS[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 128
df$BPS[df$session == 18 & df$day == 3] = 121

df$BPS[df$session == 19 & df$day == 1] = 129
df$BPS[df$session == 19 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 129
df$BPS[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 114
df$BPS[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 86
df$BPS[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 139
df$BPS[df$session == 19 & df$day == 3] = 109

df$BPS[df$session == 20 & df$day == 1] = 120
df$BPS[df$session == 20 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 120
df$BPS[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 112
df$BPS[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 82
df$BPS[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 111
df$BPS[df$session == 20 & df$day == 3] = 114

df$BPS[df$session == 21 & df$day == 1] = 113
df$BPS[df$session == 21 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 113
df$BPS[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 134
df$BPS[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 121
df$BPS[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 109
df$BPS[df$session == 21 & df$day == 3] = 117

df$BPS[df$session == 22 & df$day == 1] = 120
df$BPS[df$session == 22 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 120
df$BPS[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 109
df$BPS[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 88
df$BPS[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 105
df$BPS[df$session == 22 & df$day == 3] = 126

df$BPS[df$session == 23 & df$day == 1] = 107
df$BPS[df$session == 23 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 107
df$BPS[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 118
df$BPS[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 81
df$BPS[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 130
df$BPS[df$session == 23 & df$day == 3] = 152

df$BPS[df$session == 24 & df$day == 1] = 129
df$BPS[df$session == 24 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 129
df$BPS[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 120
df$BPS[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 110
df$BPS[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 105
df$BPS[df$session == 24 & df$day == 3] = 124

df$BPS[df$session == 25 & df$day == 1] = 115
df$BPS[df$session == 25 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 115
df$BPS[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 140
df$BPS[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 93
df$BPS[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 116
df$BPS[df$session == 25 & df$day == 3] = 108

df$BPS[df$session == 26 & df$day == 1] = 117
df$BPS[df$session == 26 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 117
df$BPS[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 118
df$BPS[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 121
df$BPS[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 133
df$BPS[df$session == 26 & df$day == 3] = 136

df$BPS[df$session == 27 & df$day == 1] = 113
df$BPS[df$session == 27 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 113
df$BPS[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 131
df$BPS[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 104
df$BPS[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 135
df$BPS[df$session == 27 & df$day == 3] = 117

df$BPS[df$session == 28 & df$day == 1] = 108
df$BPS[df$session == 28 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 108
df$BPS[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 117
df$BPS[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 89
df$BPS[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 126
df$BPS[df$session == 28 & df$day == 3] = 105

df$BPS[df$session == 29 & df$day == 1] = 108
df$BPS[df$session == 29 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 108
df$BPS[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 117
df$BPS[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 89
df$BPS[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 126
df$BPS[df$session == 29 & df$day == 3] = 105



################### manual diastolic BP inclusion
df$BPD = NA

df$BPD[df$session == 2 & df$day == 1] = 76
df$BPD[df$session == 2 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 76
df$BPD[df$session == 2 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 56
df$BPD[df$session == 2 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 45
df$BPD[df$session == 2 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 70
df$BPD[df$session == 2 & df$day == 3] = 68

df$BPD[df$session == 3 & df$day == 1] = 73
df$BPD[df$session == 3 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 73
df$BPD[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 68
df$BPD[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 65
df$BPD[df$session == 3 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 67
df$BPD[df$session == 3 & df$day == 3] = 68

df$BPD[df$session == 4 & df$day == 1] = 59
df$BPD[df$session == 4 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 59
df$BPD[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 65
df$BPD[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 46
df$BPD[df$session == 4 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 52
df$BPD[df$session == 4 & df$day == 3] = 67

df$BPD[df$session == 5 & df$day == 1] = NA
df$BPD[df$session == 5 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = NA
df$BPD[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = NA
df$BPD[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = NA
df$BPD[df$session == 5 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = NA
df$BPD[df$session == 5 & df$day == 3] = NA

df$BPD[df$session == 6 & df$day == 1] = 56
df$BPD[df$session == 6 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 56
df$BPD[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 45
df$BPD[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 58
df$BPD[df$session == 6 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 70
df$BPD[df$session == 6 & df$day == 3] = 67

df$BPD[df$session == 7 & df$day == 1] = 66
df$BPD[df$session == 7 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 66
df$BPD[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 66
df$BPD[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 53
df$BPD[df$session == 7 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 69
df$BPD[df$session == 7 & df$day == 3] = 77

df$BPD[df$session == 8 & df$day == 1] = 75
df$BPD[df$session == 8 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 75
df$BPD[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 60
df$BPD[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 58
df$BPD[df$session == 8 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 68
df$BPD[df$session == 8 & df$day == 3] = 60

df$BPD[df$session == 9 & df$day == 1] = 65
df$BPD[df$session == 9 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 65
df$BPD[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 57
df$BPD[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 67
df$BPD[df$session == 9 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 67
df$BPD[df$session == 9 & df$day == 3] = 65

df$BPD[df$session == 10 & df$day == 1] = 63
df$BPD[df$session == 10 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 63
df$BPD[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 57
df$BPD[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 67
df$BPD[df$session == 10 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 67
df$BPD[df$session == 10 & df$day == 3] = 65

df$BPD[df$session == 11 & df$day == 1] = 69
df$BPD[df$session == 11 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 69
df$BPD[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 66
df$BPD[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 56
df$BPD[df$session == 11 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 76
df$BPD[df$session == 11 & df$day == 3] = 58

df$BPD[df$session == 12 & df$day == 1] = 67
df$BPD[df$session == 12 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 67
df$BPD[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 69
df$BPD[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 52
df$BPD[df$session == 12 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 63
df$BPD[df$session == 12 & df$day == 3] = 68

df$BPD[df$session == 13 & df$day == 1] = 73
df$BPD[df$session == 13 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 73
df$BPD[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 71
df$BPD[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 47
df$BPD[df$session == 13 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 67
df$BPD[df$session == 13 & df$day == 3] = 77

df$BPD[df$session == 14 & df$day == 1] = 69
df$BPD[df$session == 14 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 69
df$BPD[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 69
df$BPD[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 43
df$BPD[df$session == 14 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 68
df$BPD[df$session == 14 & df$day == 3] = 69

df$BPD[df$session == 15 & df$day == 1] = 59
df$BPD[df$session == 15 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 59
df$BPD[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 63
df$BPD[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 61
df$BPD[df$session == 15 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 74
df$BPD[df$session == 15 & df$day == 3] = 60


df$BPD[df$session == 16 & df$day == 1] = 69
df$BPD[df$session == 16 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 69
df$BPD[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 62
df$BPD[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 40
df$BPD[df$session == 16 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 61
df$BPD[df$session == 16 & df$day == 3] = 65


df$BPD[df$session == 17 & df$day == 1] = 80
df$BPD[df$session == 17 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 80
df$BPD[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 69
df$BPD[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 48
df$BPD[df$session == 17 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 73
df$BPD[df$session == 17 & df$day == 3] = 73

df$BPD[df$session == 18 & df$day == 1] = 66
df$BPD[df$session == 18 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 66
df$BPD[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 79
df$BPD[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 68
df$BPD[df$session == 18 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 75
df$BPD[df$session == 18 & df$day == 3] = 67

df$BPD[df$session == 19 & df$day == 1] = 62
df$BPD[df$session == 19 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 62
df$BPD[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 74
df$BPD[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 47
df$BPD[df$session == 19 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 79
df$BPD[df$session == 19 & df$day == 3] = 76

df$BPD[df$session == 20 & df$day == 1] = 75
df$BPD[df$session == 20 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 75
df$BPD[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 67
df$BPD[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 41
df$BPD[df$session == 20 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 74
df$BPD[df$session == 20 & df$day == 3] = 68

df$BPD[df$session == 21 & df$day == 1] = 60
df$BPD[df$session == 21 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 60
df$BPD[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 69
df$BPD[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 69
df$BPD[df$session == 21 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 83
df$BPD[df$session == 21 & df$day == 3] = 70

df$BPD[df$session == 22 & df$day == 1] = 70
df$BPD[df$session == 22 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 70
df$BPD[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 63
df$BPD[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 64
df$BPD[df$session == 22 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 68
df$BPD[df$session == 22 & df$day == 3] = 71

df$BPD[df$session == 23 & df$day == 1] = 64
df$BPD[df$session == 23 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 64
df$BPD[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 63
df$BPD[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 59
df$BPD[df$session == 23 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 64
df$BPD[df$session == 23 & df$day == 3] = 87

df$BPD[df$session == 24 & df$day == 1] = 73
df$BPD[df$session == 24 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 73
df$BPD[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 68
df$BPD[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 69
df$BPD[df$session == 24 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 64
df$BPD[df$session == 24 & df$day == 3] = 75

df$BPD[df$session == 25 & df$day == 1] = 71
df$BPD[df$session == 25 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 71
df$BPD[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 70
df$BPD[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 50
df$BPD[df$session == 25 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 68
df$BPD[df$session == 25 & df$day == 3] = 64

df$BPD[df$session == 26 & df$day == 1] = 66
df$BPD[df$session == 26 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 66
df$BPD[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 80
df$BPD[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 70
df$BPD[df$session == 26 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 76
df$BPD[df$session == 26 & df$day == 3] = 74

df$BPD[df$session == 27 & df$day == 1] = 71
df$BPD[df$session == 27 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 71
df$BPD[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 84
df$BPD[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 49
df$BPD[df$session == 27 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 74
df$BPD[df$session == 27 & df$day == 3] = 71

df$BPD[df$session == 28 & df$day == 1] = 85
df$BPD[df$session == 28 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 85
df$BPD[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 76
df$BPD[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 46
df$BPD[df$session == 28 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 66
df$BPD[df$session == 28 & df$day == 3] = 65

df$BPD[df$session == 29 & df$day == 1] = 61
df$BPD[df$session == 29 & df$day == 2 
       & df$time..s. < hms("09:00:00")] = 61
df$BPD[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("09:00:00")
       & df$time..s. < hms("15:00:00")] = 73
df$BPD[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("15:00:00")
       & df$time..s. < hms("23:00:00")] = 67
df$BPD[df$session == 29 & df$day == 2 
       & df$time..s. >= hms("23:00:00")] = 77
df$BPD[df$session == 29 & df$day == 3] = 66



###### modeling

#head(df)
#colnames(df)
#summary(df)
df$day = as.factor(df$day)
df$permutation = as.factor(df$permutation)
df$session = as.factor(df$session)
df$immediate_action = as.factor(df$immediate_action)
df$recent_action = as.factor(df$recent_action)
#summary(df)

df2 = na.omit(df)
#colnames(df2)
names(df2)[names(df2) == "heart_rate..bpm....api.datatype.19.."] = "HR"
names(df2)[names(df2) == "breathing_rate..rpm....api.datatype.33.." ] = "Breathing_Rate"
names(df2)[names(df2) == "cadence..spm....api.datatype.53..cadence..spm....api.datatype.53.." ] = "cadence"
summary(df2)

### how 2 melt your RAM 101
library(glmnet)

### stroop
x <- model.matrix(lm(stroop~permutation+immediate_action+recent_action+
                       BPS+BPD+HR+Breathing_Rate+cadence, df2))[,-1]

y <- df2$stroop
lasso.mod <- glmnet(x,y,family="gaussian")
plot(lasso.mod, xvar="lambda")
#print(lasso.mod)

cv.lasso <- cv.glmnet(x,y, nfolds=10)
plot(cv.lasso)
#print(cv.lasso)


coef.min = coef(cv.lasso, s = "lambda.min")
coef.min
rownames(coef.min)[coef.min[,1] != 0][-1]

### DR
x2 <- model.matrix(lm(DR~permutation+immediate_action+recent_action+
                       BPS+BPD+HR+Breathing_Rate+cadence, df2))[,-1]

y2 <- df2$DR
lasso.mod2 <- glmnet(x2,y2,family="gaussian")
plot(lasso.mod2, xvar="lambda")
#print(lasso.mod2)

cv.lasso2 <- cv.glmnet(x2,y2, nfolds=10)
plot(cv.lasso2)
#print(cv.lasso)


coef.min2 = coef(cv.lasso2, s = "lambda.min")
coef.min2
rownames(coef.min2)[coef.min2[,1] != 0][-1]


### IR
x3 <- model.matrix(lm(IR~permutation+immediate_action+recent_action+
                       BPS+BPD+HR+Breathing_Rate+cadence, df2))[,-1]

y3 <- df2$IR
lasso.mod3 <- glmnet(x3,y3,family="gaussian")
plot(lasso.mod3, xvar="lambda")
#print(lasso.mod3)

cv.lasso3 <- cv.glmnet(x3,y3, nfolds=10)
plot(cv.lasso3)
#print(cv.lasso)


coef.min3 = coef(cv.lasso3, s = "lambda.min")
coef.min3
rownames(coef.min3)[coef.min3[,1] != 0][-1]
