# Data collapsed by event type
library(collapse)
dmg_data <- collap(data, FATALITIES + INJURIES + PROPMAG ~ EVTYPE, sum)

# Bar graph for property damage
plot_data <- dmg_data[order(-dmg_data$PROPMAG), ]
par(mar = c(9, 4, 4, 2))
barplot(plot_data$PROPMAG/1e+9, names.arg = gsub(" ", "\n", plot_data$EVTYPE), 
        main = "Total damage to property (monetary) by event type starting 1996", 
        ylab = "Property damage in billion dollars", las = 2)
plot_data$PROPMAG[1]*100/sum(plot_data$PROPMAG) #Flood 66.9%

# Bar graph for fatalities
plot_data <- dmg_data[order(-dmg_data$FATALITIES), ]
par(mar = c(9, 4, 4, 2))
barplot(plot_data$FATALITIES, names.arg = gsub(" ", "\n", plot_data$EVTYPE), 
        main = "Total number of fatalities by event type starting 1996", las = 2)
plot_data$FATALITIES[1]*100/sum(plot_data$FATALITIES) #Tornado 32.7%

# Bar graph for injuries
plot_data <- dmg_data[order(-dmg_data$INJURIES), ]
par(mar = c(9, 4, 4, 2))
barplot(plot_data$INJURIES, names.arg = gsub(" ", "\n", plot_data$EVTYPE), 
        main = "Total number of injuries by event type starting 1996", las = 2)
plot_data$INJURIES[1]*100/sum(plot_data$INJURIES) #Tornado 48.1%
