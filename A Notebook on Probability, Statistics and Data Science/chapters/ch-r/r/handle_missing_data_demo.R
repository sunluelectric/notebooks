rm(list = ls())
# create data frame
region <- rep(c("CBD","City","Suburbs"), each = 5)
vec_size <-  list(vec_size_cbd = rnorm(5, 75, 10),
                 vec_size_city = rnorm(5, 100, 15),
                 vec_size_suburbs = rnorm(5, 150, 25))
vec_price <- list(vec_price_cbd = vec_size$vec_size_cbd*rnorm(5, 12500, 2500),
                 vec_price_city = vec_size$vec_size_city*rnorm(5, 7500, 1000),
                 vec_price_suburbs = vec_size$vec_size_suburbs*rnorm(5, 5000, 1000))
vec_size <- unlist(vec_size)
vec_size[sample(1:15, 2)] = NA
vec_price <- unlist(vec_price)
vec_price[sample(1:15, 2)] = NA

mortgage_price <- data.frame(Region = region,
                             Size = vec_size,
                             Price = vec_price)
mortgage_price$Region <- as.factor(mortgage_price$Region)
mortgage_price$Price.Unit <- mortgage_price$Price / mortgage_price$Size
print(mortgage_price)
# find price > 750000
mortgage_price[mortgage_price$Price>750000,]