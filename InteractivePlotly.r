#Install and load plotly package
install.packages(plotly)
library(plotly)

#Load dataset
data <- read.csv("Calories.csv")
View(data) #taking a look at data to understand what I am working with

#Changing variables in 'type' column to make it appear clearer in the graph legend
data$type[data$type == "C"] <- "Cold"
data$type[data$type == "H"] <- "Hot"
data

#Creating variable with generally colour blind friendly colours for the scatterplot
usethis<-c('blue','orange')

#Make plotly graph
fig<-plot_ly(data,
             x = ~calories, y = ~rating, type = 'scatter', mode = 'markers',
             #Choose symbols preference
             symbol = ~type, symbols = c('x','o'),
             #Using colours defined previously
             color = ~type, colors = usethis,
             #Fun hover text bit!
             text=~paste("Name: ", name, "<br>Rating: ", rating)
)
# Formating and relabelling
fig <- fig %>% layout(title = '<b>Calories in snacks vs. rating<b>', plot_bgcolor = "#e5ecf6",
                      xaxis = list(title = '<b>Calories<b>'), 
                      yaxis = list(title= '<b>Rating<b>'), 
                      legend = list(title=list(text='<b> Type of Snack <b>')))
fig