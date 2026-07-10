library(ggplot2)
library(reshape2)
d1<-read.csv("elisea.csv")

#step1

ggplot()

#step2

ggplot(d1)

#step3

ggplot(d1,aes(x=conc))


#step 4

ggplot(d1,aes(x=conc,y=treated))

# step 5

ggplot(d1,aes(x=conc,y=treated))+geom_point()

# assign the plot to a varibale
p1<-ggplot(d1,aes(x=conc,y=treated))+geom_point()

p1

p2<-p1+geom_line()
p2

######33--------- plot two variables----------

d2<-melt(d1,id.vars="conc", measure.vars=c('treated','untreated'))

colnames(d2)<-c("conc", "sample","abs")

p3<-ggplot(d2,aes(x=conc, y=abs,colour = sample))+
     geom_point()
p3

p4<-p3+geom_smooth(se=FALSE, span=2)
p4


# edit axes labels and legend title

p5<- p4+ labs(x="Concentration (ng/ml)", y="Absorbance", color="Samples")
p5


# Fix axis limits
p6<-p5+ylim(0,4)
p6

p7<-p6+theme_classic()
p7

#---------------------------
#finally bring every element all at a time

final.plot<-ggplot(d2,aes(x=conc, y=abs, col=sample))+
            geom_point(size=3)+
            geom_smooth(se=FALSE,span=2)+
            labs(x="Concentration (ng/ml)", y="Absorbance", color="Sample")+
            ylim(0,4)+
            theme_classic()
final.plot
#---------------------------------------

#example 1: calling statistics within a geom_abline()

# read the FACS data and plot a frequency histogram for FL2-H

# create plot using geom_histogram()

# geom_histogram uses a statistical function to
# perform data bin ning. the binned data is ploted

facs.plot1<- ggplot(facs, aes(x=FL2.H))+
             geom_histogram()

facs.plot2<-ggplot(facs,aes(x=FL2.H))+
              geom_histogram(binwidth = 5)

theme_classic()+theme(axis.text = element_text(size=12, family='sans'))

d<-InsectSprays
# box_plot <- ggplot(d,aes(x=spray, y = count, color=spray))+
#             geom_boxplot(outlier.colour = "red", 
#                          outlier.shape = 16,
#                          outlier.size = 3,
#                          show.legend = FALSE)+
#             labs(x='Type of spray',
#                  y='Insect count')+
#             ylim(0,30)+
#             theme_classic()+
#             theme(axis.text=element_text(size=12, family='sans'),
#                   axis.title=element_text(size=14, family='sans'))
# print(box_plot)

ggplot(d,aes(x=spray, y = count, color=spray))+geom_boxplot()

xa<-filter(d,spray=='A')
summary(xa)

summary(filter(d,spray=='B'))


#-------------------------------------------------------
bar.data=iris

bar.plot1<-ggplot(bar.data,aes(x=Species, y=Petal.Length))+
           stat_summary(fun.data=mean_se,geom='bar')
                          # calculate the mean and standard error
print(bar.plot1)
