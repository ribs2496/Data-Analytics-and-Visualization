# GEOM90007 2020 Assignment 1
# Submitted by Ribhav Shridhar, 1037144, shridharr

library(ggplot2)
library(ggridges)
library(viridis)
library(hrbrthemes)

PlayStoreReviews = read.csv(file.choose()) # Data Source URL - https://www.kaggle.com/lava18/google-play-store-apps

p = ggplot(PlayStoreReviews,aes(x = Rating,y = Category, fill = stat(x))) # Initialized ggplot object with required aesthetics

p = p + geom_density_ridges_gradient(scale = 1.5, size = 0.01, rel_min_height = 0.01, jittered_points = TRUE, 
                                      position = "raincloud", point_size = 0.05, alpha = 0.5) + 
  scale_fill_gradientn(colours = terrain.colors(10)) # Adding Density Ridge gradient graph to plot the data distribution of each App category

p = p + labs(x = "App User Rating", y = "App Categories", title = "Google Play Store App User Ratings in 2019 by Categories", fill = "Rating")
# Adding axis labels, graph title, and Legend label

p = p + theme( plot.title = element_text(color="Black", size=18, face="bold", margin = margin(20,0,20,0),hjust = 0.5),
                axis.title.x = element_text(color="Black", size=15),
                axis.title.y = element_text(color="Black", size=15),
                axis.text.x = element_text(size=14),
                axis.text.y = element_text(size=12),
                panel.background = element_rect(fill = "grey90"),
                plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm"),
                plot.background = element_rect( fill = "white", colour = "black",size = 1),
                panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "grey"), 
                panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "grey"),
                legend.title	= element_text(color="Black", size=15),
                legend.text	= element_text(color="Black", size=12)
) # Applying theme to imporve the graph aesthetics

p

p + pdf(file = "C:/Users/hp/Desktop/Uni/Sem 4/Information Visualisation/Assignment1_1037144.pdf",width=10,height=10,paper='special')

dev.off()