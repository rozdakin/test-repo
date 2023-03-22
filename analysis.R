
# This is the R script for analysis
# do some analyses here

sample(1:100, 10)
# a comment

library(tidyverse)
library(readxl)

data <- read_excel('example dataset for download from v2.2.xls', skip = 6)
head(data)

data <- data %>% select(Age, Sex, YEAR, MONTH, DAY, Latitude, `Dosing body weight`, `DEE (MJ/day)`)

summary(data)

data <- mutate(data, Latitude = as.numeric(Latitude))


# Let's make a plot

myplot <- data %>%  filter(!is.na(Latitude)) %>% 
  ggplot() + 
  geom_point(aes(y = `DEE (MJ/day)`, x = Latitude, group = Sex, color = Sex)) + 
  geom_smooth(aes(y = `DEE (MJ/day)`, x = Latitude, group = Sex, color = Sex), method = 'lm')

ggsave('latitude.pdf', myplot, width = 6, height = 6)

# add some new stuff
65 * 2 # check this

# make a change
