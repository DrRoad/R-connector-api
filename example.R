#Meteomatics Weather API Connector

#Choose if timeseries or domain
request_type = "domain" #"domain","timeseries"

#Data
username = "Max"
password = "Mustermann"
time_zone = "Europe/Berlin"
startdate = ISOdatetime(year = 2017, month = 01, day = 01, hour = 00, min = 00, sec = 00, tz = "UTC")
enddate = ISOdatetime(year = 2017, month = 02, day = 01, hour = 00, min = 00, sec = 00, tz = "UTC")
interval = "PT1H"

if (request_type == "timeseries"){
  parameters = "t_2m:C,relative_humidity_1000hPa:p" #different parameters
  coordinate = "47.11,11.47" #Point or line
} else {
  #startdate is used
  parameters = "t_2m:C" #only one parameter
  coordinate = "47.9,5.7_45.8,10.7:0.1,0.1" #Rectangle
}

#Connecting with the query_api_time.R
source('query_api.R')

#Data from the API
output = query_api(username, password, startdate, enddate, interval, parameters, coordinate)

#Print Data
output
