
############################################################
# BUS 462 | Spring 2024 | Session 1
# Getting Started with R 
# CK 
# 19 JAN 2024 
## REFERENCES / Attribution: 
# (1) https://data.princeton.edu/R/gettingStarted ,
# (2) https://bookdown.org/animestina/R_Manchester/basic-principles-of-r-programming.html 
############################################################


###################################0
# 0 . Comments - anything starting with "#" means a comment ####
###################################0

# remember to hit CTRL-ENTER to run code in editor
# hit enter to run code on console

###################################0
# 1. Expressions and Assignments ####
###################################0

### Arithmetic:: R works like a calculator, you type an expression and get the answer:
1 + 2


# The standard arithmetic operators are +, -, *, /, and ^ for add, subtract, multiply, divide, and  exp
#These operators have the standard BODMAS precedence 
2^3


# You can use standard mathematical functions, such as sqrt(), exp(), and log(). For example
log(0.3/(1 - 0.3))



### Assignments :: Assigning values to variables are done by <- or =

x <- 1    # creating an object x and assigning value of 1
# x is now a vector object of class (data type) numeric with a single element with value 1
# you will see the x object on your environment screen (top right quadrant)

class(x) # see the class of x
is.vector(x) # checks if x is a vector class object
is.character(x)

# you can now operate on x, # just like excel
x+1
x <- x+1 # operating value of x
x
View(x)

y = 2 # Assign value 2 to another object

z <- x + y # create a new object that is the sum of vectors x and y

# is z a vector?
is.vector(z) #  YES - [1] TRUE 

#console print
z

### LOGIC Operations ::   < > <= >= == != |-OR  &-and  
x>y
x>=y
x<y
z==y # note that == is different than =

