#suicide and homicide data from http://www.who.int/healthinfo/statistics/mortality_rawdata/en/
#population data from http://data.worldbank.org/indicator/SP.POP.TOTL
#numerator is average over years of data available, which varies between countries (see min-max)
library(ggplot2)
library(ggrepel)

df <- read.table("D:\\ALLWORK\\PROJECTS\\Essays\\homicide_suicide.csv", sep=',', header=T, fill=T)
pop <- read.table("D:\\ALLWORK\\PROJECTS\\Essays\\population.csv", sep=',', header=T, fill=T)
df <- merge(df,pop, by="Country")
df$LSR100k <- log(df$suicides/df$Population)
df$LHR100k <- log(df$homicides/df$Population)


cor(df$LSR100k,df$LHR100k, use="complete.obs")

p <- ggplot(df,aes(x=LSR100k,y=LHR100k, colour="red", size=2, label=Country)) + 
  geom_point() +  
  geom_text_repel (aes(label=Country, hjust=0, vjust=0))
p
