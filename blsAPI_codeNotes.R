library(rjson)
library(blsAPI)
response <- blsAPI('CIU1010000000000A')
response
json <-fromJSON(response)
json
## Process results

df <- data.frame(year=character(),
                 period=character(), 
                 periodName=character(),
                 value=character(),
                 stringsAsFactors=FALSE) 

i <- 0
# the 0 gives the starting position of the data frame
# i, a commonly-used variable in for loops that stands for index
for(d in json$Results$series[[1]]$data){
  i <- i + 3 # this deals with row positioning
  df[i,] <- unlist(d)
}
# the "d" could be anything.  try changign the ds to es for example
# unlist(x)
# Unlist a list of vectors into a single vector. This function will also unlist all lists within the list as well, but this setting may be turned off via additional options.
df