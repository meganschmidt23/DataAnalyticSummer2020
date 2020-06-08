    #1. Download the data file "Wholesale_customers_data.csv". The attributes of the data are explained in comments at the top.
wh=read.csv("Wholesale_customers_data.csv", comment.char="#")
wh$Region=factor(wh$Region)
wh$Channel=factor(wh$Channel)

    #(a) Check if there are NA values and eliminate those rows
wh <- na.omit(wh)

    #(b) Obtain summary statistics of sales in each category of merchandise.
summary(wh$Fresh)
summary(wh$Milk)
summary(wh$Grocery)

    #(c) Make three different data frames containing sales data to each of the three different regions
wh_Region1=subset(wh, Region==1)
wh_Region2=subset(wh, Region==2) 
wh_Region3=subset(wh, Region==3)


    #2. Download and read in the "birthdays.csv" file. It contains birth days of 480,000+ people. Call the data frame bday.
    #(a) What classes are the month and day columns of bd, as read in. Should they be changed? If so, change them appropriately.
    #As read in, these attributes are numeric. They need to be set to factors. 
bday$month=factor(bday$month)
bday$day=factor(bday$day)

    #(b) Do a scatter plot of month on x axis and count on y axis. What do you observe about distribution of birth days? Are there any outliers ?
qplot(x=bday$month, y=bday$count, data=bday)



    #3. Load the dplyr and gapminder packages (install these if they are not installed – you might as well install tidyverse that instals a whole bunch of packages)
    #(a) Examine the gapminder dataset. How many observations and how many attributes are in the data set?
    #(b) Sort the gapminder data in descending order of life expectancy using the arrange verb from dplyr
gapminder %>% arrange(desc(lifeExp)) %>% arrange(desc(year))
    #(c) Use filter() to extract observations from just the year 1957, then use arrange to sort in descending order of population (pop).
gapminder %>% filter (year==1957) %>% arrange(desc(lifeExp))
    #(d) Use mutate() to change the existing lifeExp column, by multiplying it by 12: 12*lifeExp.
gapminder %>% mutate(lifeExp=lifeExp*12)
    #(e) Use mutate() to add a new column, called lifeExpMonths, calculated as 12*lifeExp.
gapminder %>% mutate (lifeExpMonths=lifeExp*12)
#(f) In one sequence of pipes on the gapminder dataset:
        #• filter() for observations from the year 2007,
        #• mutate() to create a column lifeExpMonths, calculated as 12*lifeExp, and
        #• arrange() in descending order of that new column
    #Save the data as data2007
data2007 <- gapminder %>% filter(year==2007) %>% mutate (lifeExpMonths=lifeExp*12) %>% arrange(desc(lifeExpMonths))
#(g) Use dplyr’s arrange and summarise functions to get a count of the countries in data2007 by continents.
data2007%>% group_by(continent) %>% summarise(count=n())
#(h) Use dplyr data wrangling functions to get counts by continents of top 50 countries with highest life expectancies. Answer will be as shown below
data2007Top50<- data2007 %>% mutate(rank=row_number()) %>% filter(rank <= 50) data2007Top50 %>% group_by(continent) %>% summarise(count=n())



    #4. In the solar.csv data (available in Data folder of “Course Documents” on BlackBoard), answer the following, with appropriate R code.
    # a. Load the data into an R data frame. The month and day columns in the data must be factors, so set them to be factors in the data frame.
solar<- read.csv("solar.csv")
    # b. What are the column names of data ?
 colnames(solar)
    # c. How many NA’s are in each column?
sol<-as_tibble(solar)
sol %>% filter(is.na(Ozone)) %>% summarise(n())
sol %>% filter(is.na(Solar.R)) %>% summarise(n()) 
sol %>% filter(is.na(Wind)) %>% summarise(n()) sol %>% filter(is.na(Temp)) %>% summarise(n()) sol %>% filter(is.na(Month)) %>% summarise(n()) sol %>% filter(is.na(Day)) %>% summarise(n())
    #d. How many months of data do you have?
sol %>% group_by(Month) %>% count() 
    # e. For each month of available data, what days registered maximum Temperature, Ozone and Wind? 
sol %>% group_by(Month)%>% summarise(max(Temp))
    # f. Eliminate all rows containing NA’s in the data frame. Rename the rows to have sequential numbers.
solar<- na.omit(solar)
row.names(solar)<- 1:nrow(solar)
    # g. Create a new data frame in which Solar.R > 300 and Temp >10 
subset(solar, Solar.R>300 & Temp>10)

