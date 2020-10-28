plot_world_map <-
  function(day1 = 27,month1=10,year1=20,type1='confirmed'){
    library(ggmap)
    library(Covid19)
    mydata <- Covid19::fetch_data()
    mydata$date = as.Date(mydata$date, format='%m-%d-%y')
    date1 = as.Date(paste(month1,day1,year1,sep = '-'), format = "%m-%d-%y")
    plot_data <-
      mydata%>%
      mutate(day=format(mydata$date, format = "%d"),month =
               format(mydata$date, format = "%m"), year =
               format(mydata$date, format = "%y"))%>%
      filter(day1==day,month1==month,year1==year, type==type1)

    if(type1=='recovered'){
      colorP = "blue"}  else if(type1=='deaths'){
      colorP='black'} else if(type1=='confirmed'){
      colorP='red'}

    mapWorld <- borders("world", fill="grey")
    ggplot() +
      mapWorld+
      geom_point(data=plot_data, aes(x=Long, y=Lat,color=colorP) )+
      theme(legend.position = "none") +
      labs(title = paste(type1, 'in', date1))
    }
