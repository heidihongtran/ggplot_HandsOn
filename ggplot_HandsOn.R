install.packages('ggplot2')
install.packages('palmerpenguins')

library(ggplot2)
library(palmerpenguins)

###Examine the data frame for the penguins data. 
  
  #The penguins dataset contains size measurements for three penguin species 
  #(Adelie, Chinstrap, and Gentoo) that live on the Palmer Archipelago in Antarctica. 
  #The columns include information such as body mass, flipper length, and bill length.

data(penguins) 
View(penguins)

##Plot the relationship between body mass and flipper length in the three penguin species. 
  #The plot shows a positive relationship between the two variables. 
  #In other words, the larger the penguin, the longer the flipper. 
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))




###AESTHETIC ATTRIBUTES:

## As the values on the x-axis increase, the values on the y-axis increase.
#Limitations: we cant tell which data points refer to each of three penguin species.
#To solve this problem, we can map the new variable "species" to the new aesthetic "color":
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))

## We can also use shape to highlight the different penguin species.
#Let's map the variable "species" to the aesthetic "shape":
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,shape=species))

# If we want, we can map more than one aesthetic to the same variable. 
# Let's map both color and shape to species:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,shape=species, color=species))

# If we like black and white plot, we can map the alpha aesthetic to species.
# This will make some points more transparent or see-through than others. 
# This gives us another way to represent each penguin species.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,alpha=species))

# mapping the aesthetic color to the variable species:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,shape=species, color="purple"))


# If we want to change the appearance of our overall plot without regard to specific variables,
#we write code outside of the aes function:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,shape=species), color="purple")




###GEOM FUNTIONS:

ggplot(data = penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))
#==>we have the same data but with different visual appearance.

# We can even use 2 geoms in the same plot:
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g))

# We can add the line type aesthetic and map it to the variable species.
#Geom_smooth will draw a different line with a different line type for each species.
#The plot shows the trend for each species of penguins.
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g, linetype=species))

# Geom_jitter function creats a scatter plot & adds a small amount of random noise to each point of the plot.
# Jittering helps us deal with over plotting.
ggplot(data = penguins)+
  geom_jitter(mapping = aes(x=flipper_length_mm, y=body_mass_g))

##Use diamonds dataset
# Geom_bar function: R automatically counts how many times each x-value appears in the data,
#then shows the counts on the y-axis. The defaults for geom_bar is to count rows
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut))

# Add color aesthetic to the plot:
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, color=cut))

# Add color to the inside of the bar:
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, fill=cut))

# Stacked bar chart:
ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut, fill=clarity))




###FACET FUNCTIONS:

# Facet_wrap helps us create separate plot for each species.
#To add a new layer to the plot, we add a "+" to our code.
#Inside the parentheses, type the tilde symbol "~" followed by the variable.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  facet_wrap(~species)


ggplot(data = penguins, aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(aes(color=species))+
  facet_wrap(~species)


##Use diamonds dataset
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=color,fill=cut))+
  facet_wrap(~cut)


# To facet the plot with 2 variables, use facet_grid: it will split the plot
#into facets vertically by the values of the 1st variable and horizontally 
#by the values of the 2nd variable.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_grid(sex~species) #there are 2 variables: sex & species




##ANNOTATE AND SAVE VISUALIZATIONS:

#We can add a title to the plot showing the relationship btw the body mass & flipper length:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length")

#We can also add a subtitle to the plot to highlight important info:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species")

#We can add a caption the same way:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", caption="Data collected by Dr. Kristen Gorman")

#We can use annotate function to add some text next to the data points:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", 
       caption="Data collected by Dr. Kristen Gorman")+
  annotate("text", x=220, y=3500, label="The Gentoos are the largest")
  
#We can add color equals followed by the name of the color:
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", 
       caption="Data collected by Dr. Kristen Gorman")+
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple")

#Edit the font, size, angle...
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", 
       caption="Data collected by Dr. Kristen Gorman")+
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)


p <- ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species", 
       caption="Data collected by Dr. Kristen Gorman")
  
#Instead of writing all the codes again, we just call p and add annotation to it:
p+annotate("text",x=220,y=3500,label="The Gentoos are the largest")

#Save the latest plot and then check it in the Files tab: 
ggsave("Three Penguin Species.png")



