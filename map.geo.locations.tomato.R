library(ggmap)
library(ggplot2)
library(raster)
library(maptools)
library(RColorBrewer)
library(gridExtra)
library(ggrepel)

#ylim = Latitude; xlim = Longitude

#accession geographic coordinates
spec.loc <- read.csv("spec.loc.csv",header=TRUE)
row.names(spec.loc) <- spec.loc[,1]

#this will be a small inset of the entire country
mapa <- borders("world", regions = c("Brazil", "Uruguay", "Argentina", "French Guiana", "Suriname", "Colombia", "Venezuela",
                                     "Bolivia", "Ecuador", "Chile", "Paraguay", "Peru", "Guyana", "Panama"), 
                fill = "white", colour = "black")

MyMapa <- ggplot() + mapa + theme_bw() + theme_void()
  
#this is zoomed in so one can see the locations of the speices and accession
mapb <- borders("world", regions = c("Ecuador","Chile", "Peru"), 
                fill = "white", colour = "black")

MyMapb <- ggplot() + mapb + theme_bw() + xlab("Longitude (decimals)") + ylab("Latitude (decimals)") + 
  geom_point(data = spec.loc, mapping = aes(x = Long, y = Lat, color = Species), size=2) + 
  geom_text_repel(data = spec.loc, aes(Long, Lat, label = ID ),
                  color = 'black',
                  size  = 3,
                  box.padding = 0.7, point.padding = 0.5)+
  scale_color_brewer(palette = "Paired") +
  theme(panel.border = element_blank(), panel.grid.major = element_line(colour = "grey80"), panel.grid.minor = element_blank())

#zoom in further to excluded the tail of chile without collections. 
MyMapb<-MyMapb + coord_fixed( xlim=c(-95,-70), ylim=c(-20,5))

MyMapb

#png(file="test.png",w=1800,h=1800, res=300)
grid.newpage()
v1<-viewport(width = 1, height = 1, x = 0.5, y = 0.5) #plot area for the main map
v2<-viewport(width = 0.3, height = 0.3, x = 0.20, y = 0.30) #plot area for the inset map
print(MyMapb,vp=v1) 
print(MyMapa,vp=v2)
#dev.off()

