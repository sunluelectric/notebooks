library(ggplot2)

rm(list=ls())

# create data frame
vec_region <- c(rep("CBD", 100), rep("City", 100), rep("Suburbs", 100))
vec_size_cbd <- rnorm(100, 75, 10)
vec_size_city <- rnorm(100, 100, 15)
vec_size_suburbs <- rnorm(100, 150, 25)
vec_size = c(vec_size_cbd, vec_size_city, vec_size_suburbs)
vec_price_cbd <- vec_size_cbd*rnorm(100, 12500, 2500)
vec_price_city <- vec_size_city*rnorm(100, 7500, 1000)
vec_price_suburbs <- vec_size_suburbs*rnorm(100, 5000, 1000)
vec_price = c(vec_price_cbd, vec_price_city, vec_price_suburbs)
mortgage_price = data.frame(Region = vec_region, Size = vec_size, Price = vec_price)
rm(vec_region, vec_size_cbd, vec_size_city, vec_size_suburbs, vec_size, vec_price_cbd, vec_price_city, vec_price_suburbs, vec_price)

# processing
mortgage_price$Price.Unit <- mortgage_price$Price / mortgage_price$Size

# plot
qplot(data=mortgage_price, x=Size, y=Price, color=Region, geom=c("point", "smooth"))
qplot(data=mortgage_price, x=Region, y=Price.Unit, geom="boxplot")

