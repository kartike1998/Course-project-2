data_clean <- data_raw
data_clean$YEAR <- format(as.Date(data_raw$BGN_DATE, "%m/%d/%Y %H:%M:%S"), "%Y")

year_table <- table(data_clean$YEAR)
sum(year_table[1:which(names(year_table) == "1996")-1]) #27.6% of total so deleted

data_clean <- data_clean[data_clean$YEAR >= 1996, ]

data_clean$EVTYPE <- toupper(data_clean$EVTYPE)

event_table <- table(data_clean$EVTYPE)
summary(as.numeric(event_table)) # median is 2 and 3rd quartile is 11.75
sum(event_table[event_table<101]) # 2327 which is very small
event_table <- event_table[event_table>100]
summary(as.numeric(event_table)) # 3rd quartile is 3478
sum(event_table[event_table<3500]) # 36462 which is very small
event_table <- event_table[event_table>3500]

print(event_table)

data_clean <- data_clean[data_clean$EVTYPE %in% names(event_table), ]

data_clean$EVTYPE <- gsub("TSTM", "THUNDERSTORM", data_clean$EVTYPE)

event_table <- table(data_clean$EVTYPE)

table(data_clean$PROPDMGEXP)
data_clean$PROPMULT <- c('K' = 1e+3, 'M' = 1e+6, 'B' = 1e+9)[data_clean$PROPDMGEXP]
data_clean$PROPMAG <- data_clean$PROPDMG*data_clean$PROPMULT
data_clean$PROPMAG[is.na(data_clean$PROPMAG)] <- 0
