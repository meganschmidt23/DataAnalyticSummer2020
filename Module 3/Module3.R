# 1. Consider the data in samples.csv file, which has a 
#single column of 2000 numeric values.
#(a) Draw a scatter plot of the data with values on y-axis
# and sequence along values on x-axis:
#Can you see any sort of pattern or distributions in the #scatter plot?
data<- read.csv("sample.csv")
ggplot(data=data, aes(x=seq_along(v), y= v))+geom_point()

#No clear pattern. Maybe a thick top bar and a thick bottom bar?

#(b) Draw frequency histograms of the values, for a number 
#of different bin sizes. Do you see any
#pattern in the distribution of the data set?

ggplot(data=s, aes(v))+geom_histogram(bins=60)
ggplot(data=s, aes(v))+geom_histogram(bins=360)

#Looks like two normal bell curves. One has a 0 average, and the other 30.




# 2. For the data shown, draw a scatter pot and a bunch of 
#possible interpolation lines as shown (not
#regression line, there is only one unique regression line).
# You will need to guess (approximate) the
#intercept and slope of the lines. You only need lines to 
#look roughly like the ones shown, nothing exact
#needed. You will have to look at some ggplot2 graphics 
#primitives like geom_abline(). Get the color
#and other graphic elements to match what I have (but don’t 
#waste too much time on it!)
ggplot(data=d, aes(x=x, y=y))+geom_point(col="red", shape="x", size=5)+geom_abline(slope = .6,
intercept = -0, col="green")+ geom_abline(slope = .8, intercept = 1 , col="green")+ geom_abline(slope
= .65, intercept = .8, col="green" )+xlim(0,8)+ylim(-2,8)+theme( plot.title = element_text(hjust =
0.5), axis.line = element_line(colour = "darkblue", size = 1, linetype = "solid"))+ggtitle("Possible
interpolation lines of x-y data")




#3. Using the mtcars dataset that come with base R(load 
#“datasets” library if it’s not already loaded),
#draw a scatterplot showing mpg (miles/gallon) along y-axis 
#and wt (weight) along x-axis, each point
#color coded by the cyl (cylinders). (look up documentation 
#on mtcars for variable names and explanations)
ggplot(mtcars, aes(x=wt, y=mpg, col=as.factor(cyl)))+geom_point()
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl))+geom_point()



#4. In each of the following, show how you arrive at your 
#answers using the appropriate R commands.
#(1) Download the vehicles.csv data file from the Data folder on 
#Blackboard. See if unknown
#information fields are present. Read the comments at the top. DO 
#NOT EDIT outside of R.

#The comments at the top say that unknowns are marked either ? or -

# Load the vehicles.csv data file into your R workspace. Make 
#sure you load all given data rows, including those with NA values.
data=read.csv("vehicles.csv", comment.char="#", na.strings=c("?","-"))

#Clean the data, get rid of NA's
nrow(data) 
data=na.omit(data) #omit NAs
nrow(data) 

#What percentage of the original data did you get rid of? Count each row as a data item.
#(392-384)/392=.02; so 2% of original data was removed.

#(5) Which attributes do you think should be factors, which 
#should be numeric? Declare them so.
#"# of cylinders" is the only one I would call a factor, since it 
#has a limited number of discrete values.
data$cylinders=factor(data$cylinders) 

#(6) Attach the data.
attach(data)

#(7) Do pairs plot of all numerical attributes.
pairs(data[c("mpg", "horsepower", "weight","displacement")])

#(8) What variables do you think are correlated to mpg?
#It looks like mpg is correlated with the other variables.

#(9) Create linear models relating mpg with other appropriate 
#variables you found in (8) one at a time (in
#other words, you create multiple models of the form mpg = a+ b X 
#where X is one of the numeric variables. You may be creating 
#more than one univariate liner regression model, but not a 
#multivariate regression model of the form mpg = a+b X+c Y+d Z, etc.)
model_mpg_hp <- lm(mpg ~ horsepower)
model_mpg_wt <- lm(mpg ~ weight)
model_mpg_disp <- lm(mpg ~ displacement)



#(10) For each of the following vehicles, predict the mpg using
# the model you created. Note that since
#you are making multiple models, there will be multiple 
#predictions for each vehicle.
#(a) horsepower=148, weight= 3719, cylinders=6, displacement=302
 predict(model_mpg_hp , data.frame(horsepower=148))
 predict(model_mpg_wt, data.frame(weight=3719))
 predict(model_mpg_disp, data.frame(displacement=302))
#(b) horsepower=194, weight= 4219, cylinders=6, displacement=390
 predict(model_mpg_hp , data.frame(horsepower=194))
 predict(model_mpg_wt, data.frame(weight=4219))
 predict(model_mpg_disp, data.frame(displacement=390))
#(c) horsepower=144, weight= 3419, cylinders=4, displacement=320
 predict(model_mpg_hp , data.frame(horsepower=144))
 predict(model_mpg_wt, data.frame(weight=3419))
 predict(model_mpg_disp, data.frame(displacement=320))

 #5. Construct a multi-variable linear regression model to 
 #predict mpg as a function of horsepower,
#weight, cylinders and displacement.
#For each of the variable values in the question above, what is 
#the mpg predicted using the multivariable regression model?
m1<- lm(mpg ~ horsepower+ weight+displacement)
m1
#mpg = 45.128132 – 0.042156*horsepower - 0.005478*weight - 0.004858*displacement
d1<- data.frame(horsepower=148,weight= 3719, cylinders=6,displacement=302)
predict(m1,d1)

#6. Use ggplot’s facet_wrap function to draw the following
# graphics of sepal length vs. sepal width and
#petal length vs. petal width separated by species. (iris dataset).
ggplot(data=iris)+geom_point(aes(x=Sepal.Length, y=Sepal.Width))+facet_wrap(~Species)
ggplot(data=iris)+geom_point(aes(x=Petal.Length, y=Petal.Width))+facet_wrap(~Species)


#7. (a) Following is a graph of median duration of unemployment, 
#in weeks, uempmed, for several years
#from the economics dataset in the ggplot2 library. The peak 
#values in each decade is marked.
#Reproduce the graph.
#(Suggestion: Calculate peak values in each decade. Figure out 
#through some online research how to
#label selected points with ggplot2.)
#(Spend some time on this, but don’t worry if you can’t get it 
#in a reasonable amount of time – move on!)

economics %>% filter(between(date, as.Date("1970-01-01"),as.Date("1979-12-31")))%>% filter(uempmed==max(uempmed))
economics %>% filter(between(date, as.Date("1980-01-01"),as.Date("1989-12-31")))%>% filter(uempmed==max(uempmed))

economics %>% filter(between(date, as.Date("1990-01-01"),as.Date("1999-12-31")))%>% filter(uempmed==max(uempmed))

economics %>% filter(between(date, as.Date("2000-01-01"),as.Date("2009-12-31")))%>% filter(uempmed==max(uempmed))

economics %>% filter(between(date, as.Date("2010-01-01"),as.Date("2019-12-31")))%>% filter(uempmed==max(uempmed))

p<-economics %>% ggplot(aes(x=date, y=uempmed))+geom_line()
p2<-p+geom_text(x=as.Date("2010-06-01"), y= 25.2,label="25.2")
p3<-p2+geom_text(x=as.Date("2009-12-01"), y= 20.1,label=sprintf('\u2190'), hjust=1)+annotate("text",x=as.Date("2009-12-01"), y= 20.1,label="20.1", hjust=1.5, vjust=.5)
p4<-p3+geom_text(x=as.Date("1994-10-01"), y= 10,label=sprintf('\u2191'), vjust=-1)+annotate("text",x=as.Date("1994-10-01"), y= 10,label="10", vjust=-2)
p5<-p4+geom_text(x=as.Date("1983-05-01"), y=12.3,label=sprintf('\u2191'), vjust=-1)+annotate("text",x=as.Date("1983-05-01"), y= 12.3,label="12.3", vjust=-2)
p6<-p5+geom_text(x=as.Date("1975-11-01"), y= 9.5,label=sprintf('\u2191'), vjust=-1)+annotate("text",x=as.Date("1975-11-01"), y= 9.5,label="9.5", vjust=-2)
p7<- p6+ylab("Median duration of unemployment - weeks")
print(p7)

#(b) From the economics data, plot the time-series 
#showing the unemployment rate as a function of time. 
economics %>% ggplot(aes(x=date, y=unemploy))+geom_line()+ylab("Unemployment-in thousands")

#(c) Comparing the two curves in (a) and (b) is there 
#anything you could hypothesize about the two
#variables, median duration of unemployment and 
#unemployment rate?
#They seem to coincide.




#8. Use the diamonds dataset, part of the ggplot library. You can get information by doing ?diamonds at
#the shell prompt.
#(a) Use a histogram to see how the price of diamonds 
#in the dataset is distributed. Adjust the bins
#parameter (or binwidth) of geom_histogram object to 
#explore the price distribution. Is the price
#distribution left-skewed, right-skewed or symmetrical? 
#(If a distribution has a “long” tail to the right
#side of the mean, it is a right-skewed distribution. 
#Similarly for left-skew. Symmetrical distribution
#means symmetrical tails around the mean.)

ggplot(data = diamonds, aes(x = price)) + geom_histogram(binwidth = 50)
#Price distribution is skewed to the right. Mean = 3922, Median = 2401

#(b) There are 5 types of cuts in the diamonds data 
#set: Fair, Good, Very Good, Premium, Ideal. Use R to
#count the % of diamonds in each cut type.

diamonds %>% group_by(cut) %>% summarise(counts = n()/nrow(.)*100)


#(c) Compare the distribution of price for the different cuts. Any statistical observations?
ggplot(data = diamonds, aes(x = price)) + geom_histogram(binwidth = 100) + + facet_wrap(~ cut)
#Skewed to the right

#(d) Create a subset of diamonds that cost less than or 
#equal to $1,000 (<=), and plot the relationship
#between price and carat in a scatterplot. Use 
#geom_point() and geom_point(position=”jitter”) and see
#the difference. Do they look radically different?
diamonds %>% filter(price < 1000) %>% ggplot(aes(x=carat, y=price))+geom_point()
diamonds %>% filter(price < 1000) %>% ggplot(aes(x=carat, y=price))+geom_point(position="jitter")

