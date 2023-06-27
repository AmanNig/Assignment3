library(ggplot2)
#a
#loading dataset iris
data("iris")
iris
#scatterplot of Sepal Length and Petal Length
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, shape = Species, color = Species)) +
  geom_point() +
  labs(x = "Sepal_Length", y = "Petal_Length", title = "Scatterplot of Sepal Length Vs Petal Length") 

#b
# Loading the txhousing dataset
data(txhousing)
#structure of datadet
str(txhousing)
#statistics of dataset
summary(txhousing)
#missing values in dataset
missing_values <- sum(!complete.cases(txhousing))
cat("Number of missing values:", missing_values, "\n")
#removing rows of all the missing values
txhousing_clean <- txhousing[complete.cases(txhousing), ]
#scatterplot of median housing prices over time
ggplot(txhousing_clean, aes(x = date, y = median)) +
  geom_point() +
  labs(x = "Date", y = "Median Housing Price", title = "Median Housing Prices Over Time")
#boxplot of housing prices of different city
ggplot(txhousing_clean, aes(x = city, y = median)) +
  geom_boxplot() +
  labs(x = "City", y = "Median Housing Price", title = "Housing Prices by City") 
#histogram of housing prices
ggplot(txhousing_clean, aes(x = median)) +
  geom_histogram(binwidth = 5000, fill = "lightblue", color = "black") +
  labs(x = "Median Housing Price", y = "Frequency", title = "Distribution of Housing Prices") 

#c
# Load the ggplot2 library
library(ggplot2)
# Load the Titanic dataset
titanic <- read.csv("titanic.csv")
# appropriate labels
titanic$Survived <- factor(titanic$Survived, levels = c(0, 1), labels = c("Dead", "Survived"))
# Create the plot
final_P <- ggplot(titanic, aes(x = Survived, y = Fare, fill = Sex)) +
  geom_boxplot() +
  labs(x = "Survived", y = "Fare", title = "Fare Vs Survived \ninrespective of Sex, richer people survived", size=6) +
  scale_fill_manual(values = c("red", "lightblue"), labels = c("Female", "Male")) +
  theme_bw() +
  coord_flip() +
  guides(fill = guide_legend(title.position = "top", nrow = 2, bycolumn = TRUE))
final_P