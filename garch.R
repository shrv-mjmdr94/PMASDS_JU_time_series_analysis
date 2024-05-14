data= read.csv("D:/PMASDS project/references/sem_3/time_series_analysis/SharePrice - SharePrice.csv")
data
attach(data)


library(tseries)
library(rugarch)
library(FinTS)
library(e1071)
library(parallel)
library(stats)

#checking stationarity
plot.ts(N225)
adf.test(N225)
rn225 = diff(log(N225))
adf.test(rn225)
plot.ts(rn225)

# checking for arch effect
ArchTest(rn225)
garch(rn225,grad = "numerical", trace=FALSE)

#for garch model specification
rn225_garch=ugarchspec(variance.model = list(garchOrder=c(1,1)),mean.model = list(armaOrder=c(1,1)))
rn225_garch_fit=ugarchfit(rn225_garch,data = rn225)
rn225_garch_fit

#plot symmetric or not
news_garch=newsimpact(rn225_garch_fit)
plot(news_garch$zx,news_garch$zy,ylab=news_garch$yexpr
     ,xlab=news_garch$xexpr,main="News Impact Curve")
#forecast
rn225_f=ugarchforecast(rn225_garch_fit,n.ahead=30)
rn225_f
#difference types of plots
plot(rn225_garch_fit)
# Fit EGARCH model
rn225_egarch=ugarchspec(variance.model = list(model="eGARCH",garchOrder=c(1,1)),mean.model = list(armaOrder=c(1,1)))
rn225_egarch_fit=ugarchfit(rn225_egarch,data = rn225)
rn225_egarch_fit
#plot symmetric or not
news_egarch=newsimpact(rn225_egarch_fit)
plot(news_egarch$zx,news_egarch$zy,ylab=news_egarch$yexpr
     ,xlab=news_egarch$xexpr,main="News Impact Curve")
rn225_ef=ugarchforecast(rn225_egarch_fit,n.ahead=30)
rn225_ef
# TGARCH/GJR GARCH Model
rn225_tgarch=ugarchspec(variance.model = list(model="gjrGARCH",garchOrder=c(1,1)),mean.model = list(armaOrder=c(1,1)))
rn225_tgarch_fit=ugarchfit(rn225_tgarch,data = rn225)
rn225_tgarch_fit
#plot symmetric or not
news_tgarch=newsimpact(rn225_tgarch_fit)
plot(news_tgarch$zx,news_tgarch$zy,ylab=news_tgarch$yexpr
     ,xlab=news_tgarch$xexpr,main="News Impact Curve")
#forecast
rn225_tf=ugarchforecast(rn225_tgarch_fit,n.ahead=20)
rn225_tf

