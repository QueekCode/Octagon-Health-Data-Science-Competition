## COPYRIGHT 2021, Octagoons, All Rights Reserved

## Authors: Kevin Schubert, Zoila Rossi, Amber Jolly, Gavincko Alagesan

## Usage of this script academically and professionally must be granted
## permission by all authors.

library(lubridate)

S2D1 = read.csv("data/S2D1.csv")
S2D2 = read.csv("data/S2D2.csv")
S2D3 = read.csv("data/S2D3.csv")


S2D1$time..s. = hms(substr(S2D1$time..s., 12, 19))
S2D1$day = 1
S2D1$permutation = 2
S2D1$session = 2
S2D1$immediate_action = "Nothing"
S2D1$recent_action = "Nothing"

S2D3$time..s. = hms(substr(S2D3$time..s., 12, 19))
S2D3$day = 3
S2D3$permutation = 2
S2D3$session = 2
S2D3$immediate_action = "Nothing"
S2D3$recent_action = "Nothing"

S2D2$time..s. = hms(substr(S2D2$time..s., 12, 19))
S2D2$day = 2
S2D2$permutation = 2
S2D2$session = 2
S2D2$immediate_action = ifelse(
  hms("09:00:00") <= S2D2$time..s. & 
    hms("10:00:00") >= S2D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S2D2$time..s. & 
      hms("16:00:00") >= S2D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S2D2$time..s. & 
        hms("23:59:59") >= S2D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S2D2$recent_action = ifelse(
  hms("09:00:00") <= S2D2$time..s. & 
    hms("14:59:59") >= S2D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S2D2$time..s. & 
      hms("22:59:59") >= S2D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S2D2$time..s. & 
        hms("23:59:59") >= S2D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(S2D1, S2D2, S2D3)



S3D1 = read.csv("data/S2D1.csv")
S3D2 = read.csv("data/S2D2.csv")
S3D3 = rbind(read.csv("data/S3D3.1.csv"), read.csv("data/S3D3.2.csv"), read.csv("data/S3D3.3.csv"))


S3D1$time..s. = hms(substr(S3D1$time..s., 12, 19))
S3D1$day = 1
S3D1$permutation = 3
S3D1$session = 3
S3D1$immediate_action = "Nothing"
S3D1$recent_action = "Nothing"

S3D3$time..s. = hms(substr(S3D3$time..s., 12, 19))
S3D3$day = 3
S3D3$permutation = 3
S3D3$session = 3
S3D3$immediate_action = "Nothing"
S3D3$recent_action = "Nothing"

S3D2$time..s. = hms(substr(S3D2$time..s., 12, 19))
S3D2$day = 2
S3D2$permutation = 3
S3D2$session = 3
S3D2$immediate_action = ifelse(
  hms("09:00:00") <= S3D2$time..s. & 
    hms("10:00:00") >= S3D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S3D2$time..s. & 
      hms("16:00:00") >= S3D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S3D2$time..s. & 
        hms("23:59:59") >= S3D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S3D2$recent_action = ifelse(
  hms("09:00:00") <= S3D2$time..s. & 
    hms("14:59:59") >= S3D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S3D2$time..s. & 
      hms("22:59:59") >= S3D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S3D2$time..s. & 
        hms("23:59:59") >= S3D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S3D1, S3D2, S3D3)



S4D1 = read.csv("data/S4D1.csv")
S4D2 = read.csv("data/S4D2.csv")
S4D3 = read.csv("data/S4D3.csv")


S4D1$time..s. = hms(substr(S4D1$time..s., 12, 19))
S4D1$day = 1
S4D1$permutation = 1
S4D1$session = 4
S4D1$immediate_action = "Nothing"
S4D1$recent_action = "Nothing"

S4D3$time..s. = hms(substr(S4D3$time..s., 12, 19))
S4D3$day = 3
S4D3$permutation = 1
S4D3$session = 4
S4D3$immediate_action = "Nothing"
S4D3$recent_action = "Nothing"

S4D2$time..s. = hms(substr(S4D2$time..s., 12, 19))
S4D2$day = 2
S4D2$permutation = 1
S4D2$session = 4
S4D2$immediate_action = ifelse(
  hms("09:00:00") <= S4D2$time..s. & 
    hms("10:00:00") >= S4D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S4D2$time..s. & 
      hms("16:00:00") >= S4D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S4D2$time..s. & 
        hms("23:59:59") >= S4D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S4D2$recent_action = ifelse(
  hms("09:00:00") <= S4D2$time..s. & 
    hms("14:59:59") >= S4D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S4D2$time..s. & 
      hms("22:59:59") >= S4D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S4D2$time..s. & 
        hms("23:59:59") >= S4D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S4D1, S4D2, S4D3)

S5D1 = read.csv("data/S5D1.csv")
S5D2 = read.csv("data/S5D2.csv")
S5D3 = read.csv("data/S5D3.csv")


S5D1$time..s. = hms(substr(S5D1$time..s., 12, 19))
S5D1$day = 1
S5D1$permutation = 2
S5D1$session = 5
S5D1$immediate_action = "Nothing"
S5D1$recent_action = "Nothing"

S5D3$time..s. = hms(substr(S5D3$time..s., 12, 19))
S5D3$day = 3
S5D3$permutation = 2
S5D3$session = 5
S5D3$immediate_action = "Nothing"
S5D3$recent_action = "Nothing"

S5D2$time..s. = hms(substr(S5D2$time..s., 12, 19))
S5D2$day = 2
S5D2$permutation = 2
S5D2$session = 5
S5D2$immediate_action = ifelse(
  hms("09:00:00") <= S5D2$time..s. & 
    hms("10:00:00") >= S5D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S5D2$time..s. & 
      hms("16:00:00") >= S5D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S5D2$time..s. & 
        hms("23:59:59") >= S5D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S5D2$recent_action = ifelse(
  hms("09:00:00") <= S5D2$time..s. & 
    hms("14:59:59") >= S5D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S5D2$time..s. & 
      hms("22:59:59") >= S5D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S5D2$time..s. & 
        hms("23:59:59") >= S5D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S5D1, S5D2, S5D3)


S6D1 = read.csv("data/S6D1.csv")
S6D2 = read.csv("data/S6D2.csv")
S6D3 = read.csv("data/S6D3.csv")


S6D1$time..s. = hms(substr(S6D1$time..s., 12, 19))
S6D1$day = 1
S6D1$permutation = 3
S6D1$session = 6
S6D1$immediate_action = "Nothing"
S6D1$recent_action = "Nothing"

S6D3$time..s. = hms(substr(S6D3$time..s., 12, 19))
S6D3$day = 3
S6D3$permutation = 3
S6D3$session = 6
S6D3$immediate_action = "Nothing"
S6D3$recent_action = "Nothing"

S6D2$time..s. = hms(substr(S6D2$time..s., 12, 19))
S6D2$day = 2
S6D2$permutation = 3
S6D2$session = 6
S6D2$immediate_action = ifelse(
  hms("09:00:00") <= S6D2$time..s. & 
    hms("10:00:00") >= S6D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S6D2$time..s. & 
      hms("16:00:00") >= S6D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S6D2$time..s. & 
        hms("23:59:59") >= S6D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S6D2$recent_action = ifelse(
  hms("09:00:00") <= S6D2$time..s. & 
    hms("14:59:59") >= S6D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S6D2$time..s. & 
      hms("22:59:59") >= S6D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S6D2$time..s. & 
        hms("23:59:59") >= S6D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S6D1, S6D2, S6D3)

S7D1 = read.csv("data/S7D1.csv")
S7D2 = read.csv("data/S7D2.csv")
S7D3 = read.csv("data/S7D3.csv")


S7D1$time..s. = hms(substr(S7D1$time..s., 12, 19))
S7D1$day = 1
S7D1$permutation = 1
S7D1$session = 7
S7D1$immediate_action = "Nothing"
S7D1$recent_action = "Nothing"

S7D3$time..s. = hms(substr(S7D3$time..s., 12, 19))
S7D3$day = 3
S7D3$permutation = 1
S7D3$session = 7
S7D3$immediate_action = "Nothing"
S7D3$recent_action = "Nothing"

S7D2$time..s. = hms(substr(S7D2$time..s., 12, 19))
S7D2$day = 2
S7D2$permutation = 1
S7D2$session = 7
S7D2$immediate_action = ifelse(
  hms("09:00:00") <= S7D2$time..s. & 
    hms("10:00:00") >= S7D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S7D2$time..s. & 
      hms("16:00:00") >= S7D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S7D2$time..s. & 
        hms("23:59:59") >= S7D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S7D2$recent_action = ifelse(
  hms("09:00:00") <= S7D2$time..s. & 
    hms("14:59:59") >= S7D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S7D2$time..s. & 
      hms("22:59:59") >= S7D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S7D2$time..s. & 
        hms("23:59:59") >= S7D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S7D1, S7D2, S7D3)


S8D1 = read.csv("data/S8D1.csv")
S8D2 = read.csv("data/S8D2.csv")
S8D3 = read.csv("data/S8D3.csv")


S8D1$time..s. = hms(substr(S8D1$time..s., 12, 19))
S8D1$day = 1
S8D1$permutation = 2
S8D1$session = 8
S8D1$immediate_action = "Nothing"
S8D1$recent_action = "Nothing"

S8D3$time..s. = hms(substr(S8D3$time..s., 12, 19))
S8D3$day = 3
S8D3$permutation = 2
S8D3$session = 8
S8D3$immediate_action = "Nothing"
S8D3$recent_action = "Nothing"

S8D2$time..s. = hms(substr(S8D2$time..s., 12, 19))
S8D2$day = 2
S8D2$permutation = 2
S8D2$session = 8
S8D2$immediate_action = ifelse(
  hms("09:00:00") <= S8D2$time..s. & 
    hms("10:00:00") >= S8D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S8D2$time..s. & 
      hms("16:00:00") >= S8D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S8D2$time..s. & 
        hms("23:59:59") >= S8D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S8D2$recent_action = ifelse(
  hms("09:00:00") <= S8D2$time..s. & 
    hms("14:59:59") >= S8D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S8D2$time..s. & 
      hms("22:59:59") >= S8D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S8D2$time..s. & 
        hms("23:59:59") >= S8D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S8D1, S8D2, S8D3)


S9D1 = read.csv("data/S9D1.csv")
S9D2 = read.csv("data/S9D2.csv")
S9D3 = read.csv("data/S9D3.csv")


S9D1$time..s. = hms(substr(S9D1$time..s., 12, 19))
S9D1$day = 1
S9D1$permutation = 3
S9D1$session = 9
S9D1$immediate_action = "Nothing"
S9D1$recent_action = "Nothing"

S9D3$time..s. = hms(substr(S9D3$time..s., 12, 19))
S9D3$day = 3
S9D3$permutation = 3
S9D3$session = 9
S9D3$immediate_action = "Nothing"
S9D3$recent_action = "Nothing"

S9D2$time..s. = hms(substr(S9D2$time..s., 12, 19))
S9D2$day = 2
S9D2$permutation = 3
S9D2$session = 9
S9D2$immediate_action = ifelse(
  hms("09:00:00") <= S9D2$time..s. & 
    hms("10:00:00") >= S9D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S9D2$time..s. & 
      hms("16:00:00") >= S9D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S9D2$time..s. & 
        hms("23:59:59") >= S9D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S9D2$recent_action = ifelse(
  hms("09:00:00") <= S9D2$time..s. & 
    hms("14:59:59") >= S9D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S9D2$time..s. & 
      hms("22:59:59") >= S9D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S9D2$time..s. & 
        hms("23:59:59") >= S9D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S9D1, S9D2, S9D3)







### yayyyy missing csvs
S10D3 = read.csv("data/S10D3.csv")

S10D3$time..s. = hms(substr(S10D3$time..s., 12, 19))
S10D3$day = 3
S10D3$permutation = 1
S10D3$session = 10
S10D3$immediate_action = "Nothing"
S10D3$recent_action = "Nothing"


df = rbind(df, S10D3)

S11D1 = read.csv("data/S11D1.csv")
S11D2 = read.csv("data/S11D2.csv")
S11D3 = read.csv("data/S11D3.csv")


S11D1$time..s. = hms(substr(S11D1$time..s., 12, 19))
S11D1$day = 1
S11D1$permutation = 2
S11D1$session = 11
S11D1$immediate_action = "Nothing"
S11D1$recent_action = "Nothing"

S11D3$time..s. = hms(substr(S11D3$time..s., 12, 19))
S11D3$day = 3
S11D3$permutation = 2
S11D3$session = 11
S11D3$immediate_action = "Nothing"
S11D3$recent_action = "Nothing"

S11D2$time..s. = hms(substr(S11D2$time..s., 12, 19))
S11D2$day = 2
S11D2$permutation = 2
S11D2$session = 5
S11D2$immediate_action = ifelse(
  hms("09:00:00") <= S11D2$time..s. & 
    hms("10:00:00") >= S11D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S11D2$time..s. & 
      hms("16:00:00") >= S11D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S11D2$time..s. & 
        hms("23:59:59") >= S11D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S11D2$recent_action = ifelse(
  hms("09:00:00") <= S11D2$time..s. & 
    hms("14:59:59") >= S11D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S11D2$time..s. & 
      hms("22:59:59") >= S11D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S11D2$time..s. & 
        hms("23:59:59") >= S11D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S11D1, S11D2, S11D3)


S12D1 = read.csv("data/S12D1.csv")
#WEEEEEEEEEEEEEEEEEEE
S12D3 = read.csv("data/S12D3.csv")


S12D1$time..s. = hms(substr(S12D1$time..s., 12, 19))
S12D1$day = 1
S12D1$permutation = 3
S12D1$session = 12
S12D1$immediate_action = "Nothing"
S12D1$recent_action = "Nothing"

S12D3$time..s. = hms(substr(S12D3$time..s., 12, 19))
S12D3$day = 3
S12D3$permutation = 3
S12D3$session = 12
S12D3$immediate_action = "Nothing"
S12D3$recent_action = "Nothing"


df = rbind(df, S12D1, S12D3)




S13D1 = read.csv("data/S13D1.csv")
S13D2 = read.csv("data/S13D2.csv")
S13D3 = read.csv("data/S13D3.csv")


S13D1$time..s. = hms(substr(S13D1$time..s., 12, 19))
S13D1$day = 1
S13D1$permutation = 1
S13D1$session = 13
S13D1$immediate_action = "Nothing"
S13D1$recent_action = "Nothing"

S13D3$time..s. = hms(substr(S13D3$time..s., 12, 19))
S13D3$day = 3
S13D3$permutation = 1
S13D3$session = 13
S13D3$immediate_action = "Nothing"
S13D3$recent_action = "Nothing"

S13D2$time..s. = hms(substr(S13D2$time..s., 12, 19))
S13D2$day = 2
S13D2$permutation = 1
S13D2$session = 13
S13D2$immediate_action = ifelse(
  hms("09:00:00") <= S13D2$time..s. & 
    hms("10:00:00") >= S13D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S13D2$time..s. & 
      hms("16:00:00") >= S13D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S13D2$time..s. & 
        hms("23:59:59") >= S13D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S13D2$recent_action = ifelse(
  hms("09:00:00") <= S13D2$time..s. & 
    hms("14:59:59") >= S13D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S13D2$time..s. & 
      hms("22:59:59") >= S13D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S13D2$time..s. & 
        hms("23:59:59") >= S13D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S13D1, S13D2, S13D3)

S14D1 = read.csv("data/S14D1.csv")
S14D2 = read.csv("data/S14D2.csv")
S14D3 = read.csv("data/S14D3.csv")


S14D1$time..s. = hms(substr(S14D1$time..s., 12, 19))
S14D1$day = 1
S14D1$permutation = 2
S14D1$session = 14
S14D1$immediate_action = "Nothing"
S14D1$recent_action = "Nothing"

S14D3$time..s. = hms(substr(S14D3$time..s., 12, 19))
S14D3$day = 3
S14D3$permutation = 2
S14D3$session = 14
S14D3$immediate_action = "Nothing"
S14D3$recent_action = "Nothing"

S14D2$time..s. = hms(substr(S14D2$time..s., 12, 19))
S14D2$day = 2
S14D2$permutation = 2
S14D2$session = 14
S14D2$immediate_action = ifelse(
  hms("09:00:00") <= S14D2$time..s. & 
    hms("10:00:00") >= S14D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S14D2$time..s. & 
      hms("16:00:00") >= S14D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S14D2$time..s. & 
        hms("23:59:59") >= S14D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S14D2$recent_action = ifelse(
  hms("09:00:00") <= S14D2$time..s. & 
    hms("14:59:59") >= S14D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S14D2$time..s. & 
      hms("22:59:59") >= S14D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S14D2$time..s. & 
        hms("23:59:59") >= S14D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S14D1, S14D2, S14D3)


S15D1 = read.csv("data/S15D1.csv")
S15D2 = read.csv("data/S15D2.csv")
S15D3 = read.csv("data/S15D3.csv")


S15D1$time..s. = hms(substr(S15D1$time..s., 12, 19))
S15D1$day = 1
S15D1$permutation = 3
S15D1$session = 15
S15D1$immediate_action = "Nothing"
S15D1$recent_action = "Nothing"

S15D3$time..s. = hms(substr(S15D3$time..s., 12, 19))
S15D3$day = 3
S15D3$permutation = 3
S15D3$session = 15
S15D3$immediate_action = "Nothing"
S15D3$recent_action = "Nothing"

S15D2$time..s. = hms(substr(S15D2$time..s., 12, 19))
S15D2$day = 2
S15D2$permutation = 3
S15D2$session = 15
S15D2$immediate_action = ifelse(
  hms("09:00:00") <= S15D2$time..s. & 
    hms("10:00:00") >= S15D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S15D2$time..s. & 
      hms("16:00:00") >= S15D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S15D2$time..s. & 
        hms("23:59:59") >= S15D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S15D2$recent_action = ifelse(
  hms("09:00:00") <= S15D2$time..s. & 
    hms("14:59:59") >= S15D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S15D2$time..s. & 
      hms("22:59:59") >= S15D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S15D2$time..s. & 
        hms("23:59:59") >= S15D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S15D1, S15D2, S15D3)








#you think this is funny?
S16D2 = read.csv("data/S16D2.csv")
S16D3 = read.csv("data/S16D3.csv")


S16D3$time..s. = hms(substr(S16D3$time..s., 12, 19))
S16D3$day = 3
S16D3$permutation = 1
S16D3$session = 16
S16D3$immediate_action = "Nothing"
S16D3$recent_action = "Nothing"

S16D2$time..s. = hms(substr(S16D2$time..s., 12, 19))
S16D2$day = 2
S16D2$permutation = 1
S16D2$session = 16
S16D2$immediate_action = ifelse(
  hms("09:00:00") <= S16D2$time..s. & 
    hms("10:00:00") >= S16D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S16D2$time..s. & 
      hms("16:00:00") >= S16D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S16D2$time..s. & 
        hms("23:59:59") >= S16D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S16D2$recent_action = ifelse(
  hms("09:00:00") <= S16D2$time..s. & 
    hms("14:59:59") >= S16D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S16D2$time..s. & 
      hms("22:59:59") >= S16D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S16D2$time..s. & 
        hms("23:59:59") >= S16D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S16D2, S16D3)

S17D1 = read.csv("data/S17D1.csv")
S17D2 = read.csv("data/S17D2.csv")
S17D3 = read.csv("data/S17D3.csv")


S17D1$time..s. = hms(substr(S17D1$time..s., 12, 19))
S17D1$day = 1
S17D1$permutation = 2
S17D1$session = 17
S17D1$immediate_action = "Nothing"
S17D1$recent_action = "Nothing"

S17D3$time..s. = hms(substr(S17D3$time..s., 12, 19))
S17D3$day = 3
S17D3$permutation = 2
S17D3$session = 17
S17D3$immediate_action = "Nothing"
S17D3$recent_action = "Nothing"

S17D2$time..s. = hms(substr(S17D2$time..s., 12, 19))
S17D2$day = 2
S17D2$permutation = 2
S17D2$session = 17
S17D2$immediate_action = ifelse(
  hms("09:00:00") <= S17D2$time..s. & 
    hms("10:00:00") >= S17D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S17D2$time..s. & 
      hms("16:00:00") >= S17D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S17D2$time..s. & 
        hms("23:59:59") >= S17D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S17D2$recent_action = ifelse(
  hms("09:00:00") <= S17D2$time..s. & 
    hms("14:59:59") >= S17D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S17D2$time..s. & 
      hms("22:59:59") >= S17D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S17D2$time..s. & 
        hms("23:59:59") >= S17D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S17D1, S17D2, S17D3)


S18D1 = read.csv("data/S18D1.csv")
S18D2 = read.csv("data/S18D2.csv")
S18D3 = read.csv("data/S18D3.csv")


S18D1$time..s. = hms(substr(S18D1$time..s., 12, 19))
S18D1$day = 1
S18D1$permutation = 3
S18D1$session = 18
S18D1$immediate_action = "Nothing"
S18D1$recent_action = "Nothing"

S18D3$time..s. = hms(substr(S18D3$time..s., 12, 19))
S18D3$day = 3
S18D3$permutation = 3
S18D3$session = 18
S18D3$immediate_action = "Nothing"
S18D3$recent_action = "Nothing"

S18D2$time..s. = hms(substr(S18D2$time..s., 12, 19))
S18D2$day = 2
S18D2$permutation = 3
S18D2$session = 18
S18D2$immediate_action = ifelse(
  hms("09:00:00") <= S18D2$time..s. & 
    hms("10:00:00") >= S18D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S18D2$time..s. & 
      hms("16:00:00") >= S18D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S18D2$time..s. & 
        hms("23:59:59") >= S18D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S18D2$recent_action = ifelse(
  hms("09:00:00") <= S18D2$time..s. & 
    hms("14:59:59") >= S18D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S18D2$time..s. & 
      hms("22:59:59") >= S18D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S18D2$time..s. & 
        hms("23:59:59") >= S18D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S18D1, S18D2, S18D3)


S19D1 = read.csv("data/S19D1.csv")
S19D2 = read.csv("data/S19D2.csv")
S19D3 = read.csv("data/S19D3.csv")


S19D1$time..s. = hms(substr(S19D1$time..s., 12, 19))
S19D1$day = 1
S19D1$permutation = 1
S19D1$session = 19
S19D1$immediate_action = "Nothing"
S19D1$recent_action = "Nothing"

S19D3$time..s. = hms(substr(S19D3$time..s., 12, 19))
S19D3$day = 3
S19D3$permutation = 1
S19D3$session = 19
S19D3$immediate_action = "Nothing"
S19D3$recent_action = "Nothing"

S19D2$time..s. = hms(substr(S19D2$time..s., 12, 19))
S19D2$day = 2
S19D2$permutation = 1
S19D2$session = 19
S19D2$immediate_action = ifelse(
  hms("09:00:00") <= S19D2$time..s. & 
    hms("10:00:00") >= S19D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S19D2$time..s. & 
      hms("16:00:00") >= S19D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S19D2$time..s. & 
        hms("23:59:59") >= S19D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S19D2$recent_action = ifelse(
  hms("09:00:00") <= S19D2$time..s. & 
    hms("14:59:59") >= S19D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S19D2$time..s. & 
      hms("22:59:59") >= S19D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S19D2$time..s. & 
        hms("23:59:59") >= S19D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S19D1, S19D2, S19D3)

S20D1 = read.csv("data/S20D1.csv")
S20D2 = read.csv("data/S20D2.csv")
S20D3 = read.csv("data/S20D3.csv")


S20D1$time..s. = hms(substr(S20D1$time..s., 12, 19))
S20D1$day = 1
S20D1$permutation = 2
S20D1$session = 20
S20D1$immediate_action = "Nothing"
S20D1$recent_action = "Nothing"

S20D3$time..s. = hms(substr(S20D3$time..s., 12, 19))
S20D3$day = 3
S20D3$permutation = 2
S20D3$session = 20
S20D3$immediate_action = "Nothing"
S20D3$recent_action = "Nothing"

S20D2$time..s. = hms(substr(S20D2$time..s., 12, 19))
S20D2$day = 2
S20D2$permutation = 2
S20D2$session = 20
S20D2$immediate_action = ifelse(
  hms("09:00:00") <= S20D2$time..s. & 
    hms("10:00:00") >= S20D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S20D2$time..s. & 
      hms("16:00:00") >= S20D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S20D2$time..s. & 
        hms("23:59:59") >= S20D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S20D2$recent_action = ifelse(
  hms("09:00:00") <= S20D2$time..s. & 
    hms("14:59:59") >= S20D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S20D2$time..s. & 
      hms("22:59:59") >= S20D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S20D2$time..s. & 
        hms("23:59:59") >= S20D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S20D1, S20D2, S20D3)


S21D1 = read.csv("data/S21D1.csv")
S21D2 = read.csv("data/S21D2.csv")
S21D3 = read.csv("data/S21D3.csv")


S21D1$time..s. = hms(substr(S21D1$time..s., 12, 19))
S21D1$day = 1
S21D1$permutation = 3
S21D1$session = 21
S21D1$immediate_action = "Nothing"
S21D1$recent_action = "Nothing"

S21D3$time..s. = hms(substr(S21D3$time..s., 12, 19))
S21D3$day = 3
S21D3$permutation = 3
S21D3$session = 21
S21D3$immediate_action = "Nothing"
S21D3$recent_action = "Nothing"

S21D2$time..s. = hms(substr(S21D2$time..s., 12, 19))
S21D2$day = 2
S21D2$permutation = 3
S21D2$session = 21
S21D2$immediate_action = ifelse(
  hms("09:00:00") <= S21D2$time..s. & 
    hms("10:00:00") >= S21D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S21D2$time..s. & 
      hms("16:00:00") >= S21D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S21D2$time..s. & 
        hms("23:59:59") >= S21D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S21D2$recent_action = ifelse(
  hms("09:00:00") <= S21D2$time..s. & 
    hms("14:59:59") >= S21D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S21D2$time..s. & 
      hms("22:59:59") >= S21D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S21D2$time..s. & 
        hms("23:59:59") >= S21D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S21D1, S21D2, S21D3)



S22D1 = read.csv("data/S22D1.csv")
S22D2 = read.csv("data/S22D2.csv")
S22D3 = read.csv("data/S22D3.csv")


S22D1$time..s. = hms(substr(S22D1$time..s., 12, 19))
S22D1$day = 1
S22D1$permutation = 1
S22D1$session = 22
S22D1$immediate_action = "Nothing"
S22D1$recent_action = "Nothing"

S22D3$time..s. = hms(substr(S22D3$time..s., 12, 19))
S22D3$day = 3
S22D3$permutation = 1
S22D3$session = 22
S22D3$immediate_action = "Nothing"
S22D3$recent_action = "Nothing"

S22D2$time..s. = hms(substr(S22D2$time..s., 12, 19))
S22D2$day = 2
S22D2$permutation = 1
S22D2$session = 22
S22D2$immediate_action = ifelse(
  hms("09:00:00") <= S22D2$time..s. & 
    hms("10:00:00") >= S22D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S22D2$time..s. & 
      hms("16:00:00") >= S22D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S22D2$time..s. & 
        hms("23:59:59") >= S22D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S22D2$recent_action = ifelse(
  hms("09:00:00") <= S22D2$time..s. & 
    hms("14:59:59") >= S22D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S22D2$time..s. & 
      hms("22:59:59") >= S22D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S22D2$time..s. & 
        hms("23:59:59") >= S22D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S22D1, S22D2, S22D3)

S23D1 = read.csv("data/S23D1.csv")
S23D2 = read.csv("data/S23D2.csv")
S23D3 = read.csv("data/S23D3.csv")


S23D1$time..s. = hms(substr(S23D1$time..s., 12, 19))
S23D1$day = 1
S23D1$permutation = 2
S23D1$session = 23
S23D1$immediate_action = "Nothing"
S23D1$recent_action = "Nothing"

S23D3$time..s. = hms(substr(S23D3$time..s., 12, 19))
S23D3$day = 3
S23D3$permutation = 2
S23D3$session = 23
S23D3$immediate_action = "Nothing"
S23D3$recent_action = "Nothing"

S23D2$time..s. = hms(substr(S23D2$time..s., 12, 19))
S23D2$day = 2
S23D2$permutation = 2
S23D2$session = 23
S23D2$immediate_action = ifelse(
  hms("09:00:00") <= S23D2$time..s. & 
    hms("10:00:00") >= S23D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S23D2$time..s. & 
      hms("16:00:00") >= S23D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S23D2$time..s. & 
        hms("23:59:59") >= S23D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S23D2$recent_action = ifelse(
  hms("09:00:00") <= S23D2$time..s. & 
    hms("14:59:59") >= S23D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S23D2$time..s. & 
      hms("22:59:59") >= S23D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S23D2$time..s. & 
        hms("23:59:59") >= S23D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S23D1, S23D2, S23D3)


S24D1 = read.csv("data/S24D1.csv")
S24D2 = read.csv("data/S24D2.csv")
S24D3 = read.csv("data/S24D3.csv")


S24D1$time..s. = hms(substr(S24D1$time..s., 12, 19))
S24D1$day = 1
S24D1$permutation = 3
S24D1$session = 24
S24D1$immediate_action = "Nothing"
S24D1$recent_action = "Nothing"

S24D3$time..s. = hms(substr(S24D3$time..s., 12, 19))
S24D3$day = 3
S24D3$permutation = 3
S24D3$session = 24
S24D3$immediate_action = "Nothing"
S24D3$recent_action = "Nothing"

S24D2$time..s. = hms(substr(S24D2$time..s., 12, 19))
S24D2$day = 2
S24D2$permutation = 3
S24D2$session = 24
S24D2$immediate_action = ifelse(
  hms("09:00:00") <= S24D2$time..s. & 
    hms("10:00:00") >= S24D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S24D2$time..s. & 
      hms("16:00:00") >= S24D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S24D2$time..s. & 
        hms("23:59:59") >= S24D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S24D2$recent_action = ifelse(
  hms("09:00:00") <= S24D2$time..s. & 
    hms("14:59:59") >= S24D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S24D2$time..s. & 
      hms("22:59:59") >= S24D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S24D2$time..s. & 
        hms("23:59:59") >= S24D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S24D1, S24D2, S24D3)



S25D1 = read.csv("data/S25D1.csv")
S25D2 = read.csv("data/S25D2.csv")
S25D3 = read.csv("data/S25D3.csv")


S25D1$time..s. = hms(substr(S25D1$time..s., 12, 19))
S25D1$day = 1
S25D1$permutation = 1
S25D1$session = 25
S25D1$immediate_action = "Nothing"
S25D1$recent_action = "Nothing"

S25D3$time..s. = hms(substr(S25D3$time..s., 12, 19))
S25D3$day = 3
S25D3$permutation = 1
S25D3$session = 25
S25D3$immediate_action = "Nothing"
S25D3$recent_action = "Nothing"

S25D2$time..s. = hms(substr(S25D2$time..s., 12, 19))
S25D2$day = 2
S25D2$permutation = 1
S25D2$session = 25
S25D2$immediate_action = ifelse(
  hms("09:00:00") <= S25D2$time..s. & 
    hms("10:00:00") >= S25D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S25D2$time..s. & 
      hms("16:00:00") >= S25D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S25D2$time..s. & 
        hms("23:59:59") >= S25D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S25D2$recent_action = ifelse(
  hms("09:00:00") <= S25D2$time..s. & 
    hms("14:59:59") >= S25D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S25D2$time..s. & 
      hms("22:59:59") >= S25D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S25D2$time..s. & 
        hms("23:59:59") >= S25D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S25D1, S25D2, S25D3)





S26D1 = read.csv("data/S26D1.csv")
S26D2 = read.csv("data/S26D2.csv")
S26D3 = read.csv("data/S26D3.csv")


S26D1$time..s. = hms(substr(S26D1$time..s., 12, 19))
S26D1$day = 1
S26D1$permutation = 3
S26D1$session = 26
S26D1$immediate_action = "Nothing"
S26D1$recent_action = "Nothing"

S26D3$time..s. = hms(substr(S26D3$time..s., 12, 19))
S26D3$day = 3
S26D3$permutation = 3
S26D3$session = 26
S26D3$immediate_action = "Nothing"
S26D3$recent_action = "Nothing"

S26D2$time..s. = hms(substr(S26D2$time..s., 12, 19))
S26D2$day = 2
S26D2$permutation = 3
S26D2$session = 26
S26D2$immediate_action = ifelse(
  hms("09:00:00") <= S26D2$time..s. & 
    hms("10:00:00") >= S26D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S26D2$time..s. & 
      hms("16:00:00") >= S26D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S26D2$time..s. & 
        hms("23:59:59") >= S26D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S26D2$recent_action = ifelse(
  hms("09:00:00") <= S26D2$time..s. & 
    hms("14:59:59") >= S26D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S26D2$time..s. & 
      hms("22:59:59") >= S26D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S26D2$time..s. & 
        hms("23:59:59") >= S26D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S26D1, S26D2, S26D3)




S27D1 = read.csv("data/S27D1.csv")
S27D2 = read.csv("data/S27D2.csv")
S27D3 = read.csv("data/S27D3.csv")


S27D1$time..s. = hms(substr(S27D1$time..s., 12, 19))
S27D1$day = 1
S27D1$permutation = 2
S27D1$session = 24
S27D1$immediate_action = "Nothing"
S27D1$recent_action = "Nothing"

S27D3$time..s. = hms(substr(S27D3$time..s., 12, 19))
S27D3$day = 3
S27D3$permutation = 2
S27D3$session = 27
S27D3$immediate_action = "Nothing"
S27D3$recent_action = "Nothing"

S27D2$time..s. = hms(substr(S27D2$time..s., 12, 19))
S27D2$day = 2
S27D2$permutation = 2
S27D2$session = 27
S27D2$immediate_action = ifelse(
  hms("09:00:00") <= S27D2$time..s. & 
    hms("10:00:00") >= S27D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S27D2$time..s. & 
      hms("16:00:00") >= S27D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S27D2$time..s. & 
        hms("23:59:59") >= S27D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S27D2$recent_action = ifelse(
  hms("09:00:00") <= S27D2$time..s. & 
    hms("14:59:59") >= S27D2$time..s. ,
  "Reading",
  
  ifelse(
    hms("15:00:00") <= S27D2$time..s. & 
      hms("22:59:59") >= S27D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S27D2$time..s. & 
        hms("23:59:59") >= S27D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S27D1, S27D2, S27D3)






S28D1 = read.csv("data/S28D1.csv")
S28D2 = read.csv("data/S28D2.csv")
S28D3 = read.csv("data/S28D3.csv")


S28D1$time..s. = hms(substr(S28D1$time..s., 12, 19))
S28D1$day = 1
S28D1$permutation = 1
S28D1$session = 28
S28D1$immediate_action = "Nothing"
S28D1$recent_action = "Nothing"

S28D3$time..s. = hms(substr(S28D3$time..s., 12, 19))
S28D3$day = 3
S28D3$permutation = 1
S28D3$session = 28
S28D3$immediate_action = "Nothing"
S28D3$recent_action = "Nothing"

S28D2$time..s. = hms(substr(S28D2$time..s., 12, 19))
S28D2$day = 2
S28D2$permutation = 1
S28D2$session = 28
S28D2$immediate_action = ifelse(
  hms("09:00:00") <= S28D2$time..s. & 
    hms("10:00:00") >= S28D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S28D2$time..s. & 
      hms("16:00:00") >= S28D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S28D2$time..s. & 
        hms("23:59:59") >= S28D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)
S28D2$recent_action = ifelse(
  hms("09:00:00") <= S28D2$time..s. & 
    hms("14:59:59") >= S28D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S28D2$time..s. & 
      hms("22:59:59") >= S28D2$time..s. ,
    "Aerobic Exercise",
    
    ifelse(
      hms("23:00:00") <= S28D2$time..s. & 
        hms("23:59:59") >= S28D2$time..s. ,
      "Sugar",
      "Nothing"
    )
  )
)

df = rbind(df, S28D1, S28D2, S28D3)



S29D1 = read.csv("data/S29D1.csv")
S29D2 = read.csv("data/S29D2.csv")
S29D3 = read.csv("data/S29D3.csv")


S29D1$time..s. = hms(substr(S29D1$time..s., 12, 19))
S29D1$day = 1
S29D1$permutation = 3
S29D1$session = 29
S29D1$immediate_action = "Nothing"
S29D1$recent_action = "Nothing"

S29D3$time..s. = hms(substr(S29D3$time..s., 12, 19))
S29D3$day = 3
S29D3$permutation = 3
S29D3$session = 29
S29D3$immediate_action = "Nothing"
S29D3$recent_action = "Nothing"

S29D2$time..s. = hms(substr(S29D2$time..s., 12, 19))
S29D2$day = 2
S29D2$permutation = 3
S29D2$session = 29
S29D2$immediate_action = ifelse(
  hms("09:00:00") <= S29D2$time..s. & 
    hms("10:00:00") >= S29D2$time..s. ,
  "TV",                                                  #kevin wuz here
  
  ifelse(
    hms("15:00:00") <= S29D2$time..s. & 
      hms("16:00:00") >= S29D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S29D2$time..s. & 
        hms("23:59:59") >= S29D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)
S29D2$recent_action = ifelse(
  hms("09:00:00") <= S29D2$time..s. & 
    hms("14:59:59") >= S29D2$time..s. ,
  "TV",
  
  ifelse(
    hms("15:00:00") <= S29D2$time..s. & 
      hms("22:59:59") >= S29D2$time..s. ,
    "Nothing",
    
    ifelse(
      hms("23:00:00") <= S29D2$time..s. & 
        hms("23:59:59") >= S29D2$time..s. ,
      "Nothing",
      "Nothing"
    )
  )
)

df = rbind(df, S29D1, S29D2, S29D3)



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












#### bruh 83 csvs, could this not have been formatted to be 
#### reasonable to automate???????? 



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
