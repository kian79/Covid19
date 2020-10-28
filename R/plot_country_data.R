plot_country_data <-
  function(start_date = '2-22-2020', end_date = '10-27-2020', country1 = 'Iran', type1='confirmed'){
    library(openair)
    mydata = Covid19::fetch_data()
    mydata$date = as.POSIXct(mydata$date, format='%m-%d-%y')
    end_date = as.POSIXct(end_date, format='%m-%d-%y')
    start_date = as.POSIXct(start_date, format='%m-%d-%y')
    my_data <-
      mydata%>%
      filter(date<end_date, date>start_date, type==type1, Country.Region == country1)
    calendarPlot(my_data,pollutant = 'num',annotate = 'value', lim=3000,
                  cols = c("lightgreen","yellow",'orange',"red"),
                 col.lim = c('Black','Black'), key.header = 'بسیار زیاد',
                 key.footer = 'عادی',key.position = 'right',main='تعداد مبتلایان جدید هر روز کووید-۱۹ در  ایران'
                 , auto.text = FALSE, cex.lim = c(0.3,0.5))
  }
