library(ggplot2)
library(plotly)
library(wordcloud2)
data1<-read.csv("C:/Users/Kiran/Desktop/placement/1617.csv")
#*****************************************no of students selected for different compines************************************************************
company<-aggregate(cbind(no_persons=COMPANY)~COMPANY ,data=data1,FUN=function(x){NROW(x)})
company_graph<-ggplot(company, aes(COMPANY, no_persons,fill=COMPANY)) + geom_col()
ggplotly(company_graph)


p <- plot_ly(company, labels = ~COMPANY, values = ~no_persons, type = 'pie') %>%
  layout(title = 'No of students selected for a company',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p

wordcloud2(company, size = 1.5, color = "skyblue", backgroundColor="black")
wordcloud2(company, size = 2.3, minRotation = -pi/8, maxRotation = -pi/8, rotateRatio = 1)
wordcloud2(company, size=2.6)
letterCloud( company, word = "k", color='random-light' , backgroundColor="black")
#********************************* selected branch wise in 1617**************************************************************************
sb<- subset(data1,COLLEGE == 'AEC' )
branch<-aggregate(cbind(no_persons=Branch)~Branch ,data=sb,FUN=function(x){NROW(x)})
k<- plot_ly(branch, labels = ~Branch, values = ~no_persons, type = 'pie') %>%
   layout(title = 'Branch wise selected students  in 2015-16',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
k
#******************************Branch wise selected students for cgi  in AEC*****************************************************************
cgi<- subset(data1, COMPANY == "CGI" &  COLLEGE == 'AEC' )
cgi_b<-aggregate(cbind(no_persons=Branch)~Branch ,data=cgi,FUN=function(x){NROW(x)})
graph<-ggplot(cgi_b, aes(no_persons, Branch,fill=no_persons)) + geom_col()+ ggtitle("BRanch wise CGI selected students From AEC")
ggplotly(graph)
#***********************************capgemini selected students branch wise******************************************************************
capgemini<- subset(data1, COMPANY == "CAPGEMINI" &  COLLEGE == 'AEC' )
cgi_b<-aggregate(cbind(no_persons=Branch)~Branch ,data=capgemini,FUN=function(x){NROW(x)})
p <- cgi_b %>%
  plot_ly(labels = ~Branch, values = ~no_persons) %>%
  add_pie(hole = 0.6) %>%
  layout(title = "No of students selected for CApgemini branch wise",  showlegend = F,
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p
#***********************************************************************************************************
