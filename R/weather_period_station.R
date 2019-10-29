#' Returns a tibble with hourly weather data for a period of several days
#' @param date_beginning the date of the beginning of the period of interest, formatted as a year-month-day string (e.g. 2019-03-27)
#' @param date_end the date of the end of the period of interest, formatted as a year-month-day string (e.g. 2019-03-27)
#' @param station_name the name of the station of interest, for instance "dole-tavaux"
#' @param identifiant_station the ID of the station of interest, for instance "07386"
#' @return a tibble
#' @export
#' @examples
#' library(scrapInfoclimat)
#' weather_period_station(date_beginning="2018-06-01",
#'                       date_end="2018-06-03",
#'                       station_name="dole-tavaux",
#'                       station_id="07386")

weather_period_station=function(date_beginning,
                              date_end,
                              station_name,
                              station_id){
  
 period <- seq(lubridate::ymd(date_beginning),
      lubridate::ymd(date_end),
      1)
 data <- data.frame()
 for (i in 1:length(period)) {
   y <- weather_date_station(date=period[i],station_name = station_name, station_id = station_id)
   data <- rbind(data, y)
   system('sleep 3')
   }
 return(data)
}
