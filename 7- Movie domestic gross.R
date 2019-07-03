#import the data
getwd()

movie <- read.csv("7- Movie domestic gross.csv")

#check data
head(movie)
summary(movie)
str(movie)


#activate ggplot2
#install.packages("ggplot2")
library(ggplot2)
install.packages("extrafont")
library(extrafont)

#additional insight
ggplot(data = movie, aes(x=Day.of.Week)) + geom_bar()


#filter on Movie Genre
filt <- movie$Genre == "action" | movie$Genre == "adventure" | movie$Genre == "animation" | movie$Genre == "comedy" | movie$Genre == "drama"

#filter on Studio
filt2 <- movie$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")


movie2 <- movie[filt & filt2,]
movie2


#prepare the plot's data

p <- ggplot(data = movie2, aes(x = Genre, y = Gross...US))
#add geometries
q <- p + 
      geom_jitter(aes(size=Budget...mill., colour=Studio)) +
      geom_boxplot(alpha = 0.7, outlier.colour = NA)

#non-data part
q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q


#theme
q <- < +
  theme(
        axis.title.x = element_text(colour="Blue", size=30),
        axis.title.y = element_text(colour="Blue", size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        plot.title = element_text(hjust = 0.5,size = 40),
        legend.title = element_text(size = 20)
        
        text = element_text(family = "Comic Sans MS")
        
        )
q


