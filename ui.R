
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(plotly)
library(wordcloud2)
library(rsconnect)

shinyUI(fluidPage(
 # headerPanel(title=HTML("  <center><i><font color='blue'><b> PLACEMENTDATA VISUALIZATION</b></font></i></center>")),
  

  # Application title
  #titlePanel("no of students selected for different compines"),
  
  HTML("<br>"),HTML("<br>"),
  

  # Sidebar with a slider input for number of bins
  #headerPanel(title=HTML("<i><b> <h4>Compines Visited Our campus</h4></b></i>")),
  fluidRow(
   column(12, wordcloud2Output("value1"))
   ),
  HTML("<br><br>"),
  #headerPanel(title=HTML("<i><b> <h4>Branch wise  selected students in 2016-17</h4></b></i>")),
  title = '',
  fluidRow(
    column(12,plotlyOutput("value2"))
  ),
  HTML("<br>"),
  #headerPanel(title=HTML("<i><b> <h4>BRanch wise CGI selected students </h4></b></i>")),
  
  fluidRow(
    column(12,plotlyOutput("value3"))
  ),
  
  HTML("<br>"),
  #headerPanel(title=HTML("<i><b> <h4>No of students selected for CApgemini branch wise</h4></b></i>")),
  fluidRow(
    column(12,plotlyOutput("value4"))
  )
))

