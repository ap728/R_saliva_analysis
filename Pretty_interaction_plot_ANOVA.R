### Interaction plots for visualizing 2-way ANOVA interaction
### Useful for looking at menstrual cycle phase by group, etc.


### GGplot2 interaction plot
### In this setup, variable of interest is IGF1, and this run uses Erin's dataset
### assumes you are starting with a filtered dataset called "mydata"

### Calculate mean over group/mens phase using aggregate
### Returns mean as a column x 
my_small_data <- with(mydata, aggregate(IGF1, list(ASC=ASC, GRP_MENS=GRP_MENS),mean))

### Definte standard error of the mean because apparently it doesn't come predefined
se <- function(x) sd(x)/sqrt(length(x))

### Calculate standard error of the mean over group/mens phase
### Returns standard error of the mean as se.x but not it's own variable
my_small_data$se <- with(mydata, aggregate(IGF1, list(ASC=ASC, GRP_MENS=GRP_MENS), se))

### Return se.x as it's own vector - 2 step
my_smaller_data <- my_small_data[,4] ### Step 1 - turn 4th variable into smaller dataframe
my_small_data$stderr <- my_smaller_data[,3]  ### Step 2 - add 3rd variable (se.x) back onto dataframe

### Set theme
opar <- theme_update(panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(),
                     panel.background = element_rect(colour = "black"))


### Plot your data
gp <- ggplot(my_small_data, aes(x=GRP_MENS, y=x, colour=ASC, group=ASC))

gp +
  geom_point(aes(shape=ASC), size=3) + ylab("IGF pg/mL") + xlab("Menstrual Cycle Phase")+
  geom_errorbar(aes(ymax=x+stderr, ymin=x-stderr), width=.1) + ggtitle("Erin Females")
theme_set(opar)







