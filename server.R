
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(plotly)
library(wordcloud2)
library(rsconnect)

data1<-read.csv("file/1617.csv")

shinyServer(function(input, output) {

  output$value1 <- wordcloud2::renderWordcloud2({

    #*****************************************no of students selected for different compines************************************************************
    company<-aggregate(cbind(no_persons=COMPANY)~COMPANY ,data=data1,FUN=function(x){NROW(x)})
    wordcloud2(company, size = 3.3, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
})

  output$value2 <- renderPlotly({
    sb<- subset(data1,COLLEGE == 'AEC' )
    branch<-aggregate(cbind(no_persons=Branch)~Branch ,data=sb,FUN=function(x){NROW(x)})
    k<- plot_ly(branch, labels = ~Branch, values = ~no_persons, type = 'pie') %>%
    layout(
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    k
  }) 
  output$value3 <-renderPlotly({
    cgi<- subset(data1, COMPANY == "CGI" &  COLLEGE == 'AEC' )
    cgi_b<-aggregate(cbind(no_persons=Branch)~Branch ,data=cgi,FUN=function(x){NROW(x)})
    graph<-ggplot(cgi_b, aes(no_persons, Branch,fill=Branch)) + geom_col()+ ggtitle("")
    ggplotly(graph)
    
  })
  output$value4 <-renderPlotly({
    capgemini<- subset(data1, COMPANY == "CAPGEMINI" &  COLLEGE == 'AEC' )
    cgi_b<-aggregate(cbind(no_persons=Branch)~Branch ,data=capgemini,FUN=function(x){NROW(x)})
    p <- cgi_b %>%
      plot_ly(labels = ~Branch, values = ~no_persons) %>%
      add_pie(hole = 0.6) %>%
      layout(title = "",  showlegend = F,
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    p
  }
  )

})

