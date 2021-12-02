###This script loads example survey data, finds means, medians, etc., and employs a number
##of inferential statistics

#library(surveydata)
#library(xlsxjars)
#library(xlsx)
library(readxl)
library(tidyverse)

#This writes out the data file - column headers changed in excel.
#data <- data.frame(membersurvey[,c("id","Q1_1", "Q1_2","Q4", "Q5","Q9_2","Q12_1","Q32", "Q35")])
#write.csv(data, file="data.csv")
#write.xlsx(data, "data.xlsx", col.names = TRUE, row.names = FALSE)

data <- read_excel("data.xlsx")
cor(data$`Years as Employee`, data$`Years as Independent`, use = "complete.obs")
plot(data$`Years as Employee`, data$`Years as Independent`)
years.lm <- lm(`Years as Independent` ~ `Years as Employee`  , data = data)
summary(years.lm)
abline(years.lm)

gender.years.lm <- lm(`Years as Independent` ~ Gender + `Years as Employee`  , data = data)
summary(gender.years.lm)

ggplot(data, aes(x = `Years as Employee`, y = `Years as Independent`,
                 group = Gender, color = Gender)) +  geom_point() + geom_smooth(method = "lm", fill = NA)