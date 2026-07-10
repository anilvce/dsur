h<-density(c(0,0,0,38,50,51.7,64,146))
plot(h)
?BOD

library(ggplot2)
#data()
?BOD
ggplot(data=BOD, mapping=aes(x=Time, y=demand))
ggplot(data=BOD, mapping=aes(x=Time, y=demand))+geom_point()
ggplot(data=BOD, mapping=aes(x=Time, y=demand))+geom_point(size=5)
ggplot(data=BOD, mapping=aes(y=Time, x=demand))+geom_point(size=5)+geom_line(color='red')

ggplot(BOD, aes(Time, demand))+geom_point()+geom_line()
ggplot(BOD, aes(Time, demand))+geom_point(size=3)+geom_line(colour='red')

#----------------------------------
gp=ggplot(CO2,aes(conc,uptake,colour = Treatment))
print(gp+geom_point())
print(gp+geom_point(alpha=0.5))
unique(CO2$Type)
print(gp+geom_point()+geom_smooth(method=lm,se=F))
gp1=gp+geom_point()+geom_smooth(method=lm,se=F)+facet_wrap(~Type)
print(gp1)
#-------------------------------
A=CO2
b1<-ggplot(CO2,aes(Treatment,uptake,size=conc,colour = Plant))
b1+geom_point()
b1+geom_boxplot()
print(gp1+labs(title='Concentration of CO2') ) 

b2<-ggplot(CO2,aes(Treatment,uptake), )+geom_point(alpha=0.5,aes(size=conc,colour = Plant))
print(b2)
##3-------------------------------
t=mpg
a=ggplot(mpg,aes(displ,cty))
a+geom_point()+facet_wrap(~year,nrow=1)
a+geom_point(aes(colour=drv,size=trans),alpha=0.5)+geom_smooth(method=lm)+theme_minimal()


#-----------------------------------
customer_data=readRDS("custdata.RDS")
summary(customer_data)
library(data.table)
setnames(customer_data, old = "sex", new = "gender")
summary(customer_data)
class(customer_data)
write.csv(customer_data,file='custdata.csv',row.names = FALSE)
#---------------------------------

