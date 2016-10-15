# First create for each three predictors
# Then create the overall regression

# scatterplot-tv-sales
jpeg('./images/scatterplot-tv-sales.png')
plot(Advertising$Sales ~ Advertising$TV)
dev.off()
# regression of sales - tv
reg_tv = lm(Advertising$Sales ~ Advertising$TV)

# scatterplot-radio-sales
jpeg('./images/scatterplot-radio-sales.png')
plot(Advertising$Sales ~ Advertising$Radio)
dev.off()
# regression of sales - radio
reg_radio = lm(Advertising$Sales ~ Advertising$Radio)

# scatterplot-newspaper-sales
jpeg('./images/scatterplot-newspaper-sales.png')
plot(Advertising$Sales ~ Advertising$Newspaper)
dev.off()
# regression of sales - newspaper
reg_news = lm(Advertising$Sales ~ Advertising$Newspaper)

# overall regression
reg_all = lm(Advertising$Sales ~ Advertising$TV+Advertising$Radio+Advertising$Newspaper)

# Residual plot
residual = summary(reg_all)$residuals
jpeg('./images/residual-plot.png')
plot(reg_all, which=1)
dev.off()

# Scale-location-plot
jpeg('./images/scale-location-plot.png')
plot(reg_all, which=3)
dev.off()

# Normal Q-Q plot
jpeg('./images/normal-qq-plot.png')
plot(reg_all, which=2)
dev.off()

## Save regression.RData
save(reg_all, reg_tv, reg_radio, reg_news, file='data/regression.RData')
