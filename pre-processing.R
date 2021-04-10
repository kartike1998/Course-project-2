data$YEAR <- format(as.Date(data$BGN_DATE, "%m/%d/%Y %H:%M:%S"), "%Y")



t <- table(toupper(data$EVTYPE))
k <- t[t>100]
summary(as.numeric(k))

a <- data$BGN_DATE[1]
c <- as.POSIXlt(a, format = "%m/%d/%Y %H:%M:%S")
