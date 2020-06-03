#1. You have a vector y containing revenues from tips on weekdays (Mon - Fri)
y <- c(79, 49, 59, 115, 120)
    #a. attach a name to each value, “Mon” to “Fri” for the days of the week using attributes() function.
attributes(y)<- list(names=c("Mon","Tue","Wed","Thu","Fri"))
attributes(y)
    #b. print y, confirm that each tip value has the correct name attached to it.
y
    #c. Now set the names to NULL using names(y)<- NULL
names(y)<-NULL 
y   
    #d. Set the names property again, this time using names() function
names(y)<-list("Mon", "Tues", "Wed", "Thurs", "Fri")    
y
    #e. What happens if you give only two names for the vector: names(y) <- c(“Mon”, “Tues”)?
names(y)<-list("Mon", "Tues")
y
#The names for the other values show NA



    #2. Assume that you have the tips income:
tips <- c( 125, 122, 110, 89, 123, 99, 100)
    #Create a vector, low, of tips less than 100:
low<- tips[tips<100]
low
    #(a) Using subset() function
low<- tips[tips<100]
low
    #(b) Using [ ] for subsetting
#Same as a




    #3. If a named vector is subsetted using [] , (such as y[c(2, 5)]), will the resulting vector be named?
y[c(2,2,2)]
y[c(2,5)]
#When you use [ ], the names match exactly




    #4. You have a list:
x<- list(foo=1:3, bar=c("amy", "adams"), num=2, mat=matrix(c(1:12), nrow=3))
    #a. Retrieve the component with name “bar” from the list. Is the retrieved object a vector? A list?
            #Do the retrieved objects retain their names?
x[[1]]
#The result is the [1, 2, 3] vector, and the name foo has been lost.
x[1]
#The result is the same vector, but the foo name remains
    #b. Retrieve the component with name “num” from the list. Is the retrieved object a number?
x$num #Returns a number
x["num"] #Returns a list, not a number



    #5. Suppose you have a list:
x<- list(c(1:3), c("amy", "adams"), 2, matrix(c(1:12), nrow=3))
    #a. Retrieve the 3rd list element by index.
x[[3]] #single item
    #b. If you subset x with x[[4]] what type of object do you get?
x[[4]]
#You get a 3x4 matrix
    #c. If you subset x with x[4] what type of object would you get?
t <- x[4] 
t   
#It looks like a list with a matrix in it (double check, does this make sense?)
    #d. Note the difference between x[4] and x[[4]]
#Matrix vs list




    #6. D is a matrix of dimension (m, n).
D<-matrix(1:20, nrow=5, byrow=T)
D
    #a. Extract the i-th column of D, assuming i<=n
#D[,i]
D[,4] #4th column example    
    #b. Extract the j-th row of D, assuming j<=m
#D[,j]
D[,3] #3rd row example



    #7. Let m <- matrix(1:20,nrow=4)
        #Use subsetting by indexes to retrieve the sub-matrix of m consisting of first 3 rows and last 3 columns.
        #The retrieved object must be a matrix of dimension (3, 3)
m <- matrix(1:20,nrow=4)
m   
#Subset of m to get first 3 rows, last 3 columns     
m[c(1,2,3),c(3,4,5)]



    #8. Consider a data frame:
df <- data.frame(day=c("Mon", "Tue", "Wed", "Sat", "Sat", "Mon"), Gains=c(10, 20, -20, -30, -40, 10),Type=c("Warm","Hot", "Cold", "Cold", "Cold", "Warm"))
    #a. Subset the df to get a data frame where Gains is more than 5
subset(df, df$Gains > 5)
    #b. Subset the df to get a data frame where Gains is less than -5
subset(df, df$Gains < -5)    