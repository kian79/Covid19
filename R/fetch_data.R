fetch_data <-
  function(){
    library(stringr)
    library(dplyr)
    library(tidyr)
  global_confirmed_cases_csv = url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
    global_deaths_csv = url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
    global_recovered = url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")
    confirmed_cases = read.csv(global_confirmed_cases_csv)
    deaths = read.csv(global_deaths_csv)
    recovered = read.csv(global_recovered)
    arr = colnames(confirmed_cases)
    len = length(arr)
    for (i in 1:len){
      if(startsWith(arr[i],'X')){
        print(arr[i])
        edited = str_remove(arr[i],'X')
        parts = unlist(str_split(edited,'\\.'))
        parts[3] = '2020'
        my_date = paste(parts[1],parts[2],parts[3], sep ="-")
        colnames(confirmed_cases)[i] = my_date
        colnames(deaths)[i] = my_date
        colnames(recovered)[i] = my_date
      }
    }
    recovered <-recovered %>%
      gather(date, num , 5:len)
    deaths <-
      deaths%>%
      gather(date, num , 5:len)
    confirmed_cases <-
      confirmed_cases%>%
      gather(date, num , 5:len)
    confirmed_cases <-
      confirmed_cases%>%
      mutate(type = 'confirmed')
    deaths <-
      deaths%>%
      mutate(type = 'deaths')
    recovered <-
      recovered%>%
      mutate(type = 'recovered')
    covid_data = rbind(recovered,confirmed_cases,deaths)
    return(covid_data)
  }
