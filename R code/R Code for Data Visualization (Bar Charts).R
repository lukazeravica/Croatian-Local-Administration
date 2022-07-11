getwd()

setwd("D:\\Projekt Data Analytics")

library(ggplot2)

# Eastern Croatia (Slavonia)

setwd("D:\\Projekt Data Analytics\\POSTGREQSL tablice")

SlavonianAdministrativeUnits=read.csv("Slavonian Administrative Units.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

#Administrative Units Bar Chart

SlavonianPlot=ggplot(data=SlavonianAdministrativeUnits, aes(x=county))  

SlavonianPlot
SlavonianBarChart=SlavonianPlot+ geom_bar(size=1, aes(fill=administrative_unit_type),color="Black") + theme(axis.text.x = element_text(size = 9))

SlavonianBarChart01=SlavonianBarChart + ylim(0,50)+ylab("Unit Type Count")+xlab("Counties")+scale_fill_manual(values = c("CITY"="gray70", "MUNICIPALITY"="mediumpurple1"
))
                                                                                                                              
SlavonianBarChart01

SlavonianBarChart02=SlavonianBarChart01 + theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + guides(fill=guide_legend(title="Unit Type"))

SlavonianBarChart02

#Incumbents Bar Chart

SlavonianIncumbents=read.csv("Slavonian Incumbents.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

SlavonianIncumbents                               

SlavonianIncumbentsPlot=ggplot(data=SlavonianIncumbents, aes(x=county))

SlavonianIncumbentsPlot01=SlavonianIncumbentsPlot+geom_bar(size=1, aes(fill=function_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) 

SlavonianIncumbentsPlot01

SlavonianIncumbentsPlot02=SlavonianIncumbentsPlot01+ylab("Incumbent Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 8))+ guides(fill=guide_legend(title="Incumbent Function"))

SlavonianIncumbentsPlot02

# Minority Deputy Mayors Bar Chart

SlavonianMinorityDeputyMayors=read.csv("Slavonian Minorities Deupty Mayors.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

SlavonianMinorityDeputyMayors

SlavonianMinorityDeputyMayorsBarchart=ggplot(data=SlavonianMinorityDeputyMayors, aes(x=county))

SlavonianMinorityDeputyMayorsBarchart01=SlavonianMinorityDeputyMayorsBarchart+geom_bar(size=1, aes(fill=minority_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + guides(fill=guide_legend(title="Minority Name"))+ylim(0,15)

SlavonianMinorityDeputyMayorsBarchart02=SlavonianMinorityDeputyMayorsBarchart01+ylab("Minority Deputy Mayor Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 7))+scale_fill_manual(values = c("BOSNIAN"="gold","CROATIAN"="palegreen3","HUNGARIAN"="royalblue3","RUSSIAN"="skyblue1","SLOVAKIAN"="violet","SERBIAN"="mediumpurple1"))


SlavonianMinorityDeputyMayorsBarchart02


#Northern (Central) Croatia

setwd("D:\\Projekt Data Analytics\\POSTGREQSL tablice")

CentralCroatianAdministrativeUnits=read.csv("Central Croatian Administrative Units.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

#Administrative Units Bar Chart

CentralCroatianPlot=ggplot(data=CentralCroatianAdministrativeUnits, aes(x=county))  

CentralCroatianPlot
CentralCroatianBarChart=CentralCroatianPlot+ geom_bar(size=1, aes(fill=administrative_unit_type),color="Black") + theme(axis.text.x = element_text(size = 4.3))

CentralCroatianBarChart01=CentralCroatianBarChart + ylim(0,50)+ylab("Unit Type Count")+xlab("Counties")+scale_fill_manual(values = c("CITY"="gray70", "MUNICIPALITY"="mediumpurple1"
))

CentralCroatianBarChart01

CentralCroatianBarChart02=CentralCroatianBarChart01 + theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + guides(fill=guide_legend(title="Unit Type"))

CentralCroatianBarChart02

#Incumbents Bar Chart

CentralCroatianIncumbents=read.csv("Central Croatian Incumbents.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

CentralCroatianIncumbents                               

CentralCroatianIncumbentsPlot=ggplot(data=CentralCroatianIncumbents, aes(x=county))

CentralCroatianIncumbentsPlot01=CentralCroatianIncumbentsPlot+geom_bar(size=1, aes(fill=function_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15))+ ylim(0,125) 

CentralCroatianIncumbentsPlot01

CentralCroatianIncumbentsPlot02=CentralCroatianIncumbentsPlot01+ylab("Incumbent Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 8))+ guides(fill=guide_legend(title="Incumbent Function"))+ theme(axis.text.x = element_text(size = 4.3))

CentralCroatianIncumbentsPlot02

# Minority Deputy Mayors Bar Chart

CentralCroatianMinorityDeputyMayors=read.csv("Central Croatian Minorities Deupty Mayors.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

CentralCroatianMinorityDeputyMayors

CentralCroatianMinorityDeputyMayorsBarchart=ggplot(data=CentralCroatianMinorityDeputyMayors, aes(x=county))

CentralCroatianMinorityDeputyMayorsBarchart01=CentralCroatianMinorityDeputyMayorsBarchart+geom_bar(size=1, aes(fill=minority_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) +ylim(0,15)

CentralCroatianMinorityDeputyMayorsBarchart02=CentralCroatianMinorityDeputyMayorsBarchart01+ylab("Minority Deputy Mayor Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 7)) + guides(fill=guide_legend(title="Minority Name"))

CentralCroatianMinorityDeputyMayorsBarchart02

# Western Croatia (Istria and Hills Croatia)

setwd("D:\\Projekt Data Analytics\\POSTGREQSL tablice")

WesternCroatianAdministrativeUnits=read.csv("Western Croatian Administrative Units.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

#Administrative Units Bar Chart

WesternCroatianPlot=ggplot(data=WesternCroatianAdministrativeUnits, aes(x=county))  

WesternCroatianPlot
WesternCroatianBarChart=WesternCroatianPlot+ geom_bar(size=1, aes(fill=administrative_unit_type),color="Black") + theme(axis.text.x = element_text(size = 9))

WesternCroatianBarChart01=WesternCroatianBarChart + ylim(0,50)+ylab("Unit Type Count")+xlab("Counties")+scale_fill_manual(values = c("CITY"="gray70", "MUNICIPALITY"="mediumpurple1"
))

WesternCroatianBarChart01

WesternCroatianBarChart02=WesternCroatianBarChart01 + theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + guides(fill=guide_legend(title="Unit Type"))

WesternCroatianBarChart02

#Incumbents Bar Chart

WesternCroatianIncumbents=read.csv("Western Croatian Incumbents.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

WesternCroatianIncumbents                               

WesternCroatianIncumbentsPlot=ggplot(data=WesternCroatianIncumbents, aes(x=county))

WesternCroatianIncumbentsPlot01=WesternCroatianIncumbentsPlot+geom_bar(size=1, aes(fill=function_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + ylim(0,150)

WesternCroatianIncumbentsPlot01

WesternCroatianIncumbentsPlot02=WesternCroatianIncumbentsPlot01+ylab("Incumbent Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 8))+ guides(fill=guide_legend(title="Incumbent Function"))

WesternCroatianIncumbentsPlot02

# Minority Deputy Mayors Bar Chart

WesternCroatianMinorityDeputyMayors=read.csv("Western Croatian Minority Deputy Mayors.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

WesternCroatianMinorityDeputyMayors

WesternCroatianMinorityDeputyMayorsBarchart=ggplot(data=WesternCroatianMinorityDeputyMayors, aes(x=county))

WesternCroatianMinorityDeputyMayorsBarchart01=WesternCroatianMinorityDeputyMayorsBarchart+geom_bar(size=1, aes(fill=minority_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + theme(legend.title = element_blank())+ylim(0,10)

WesternCroatianMinorityDeputyMayorsBarchart02=WesternCroatianMinorityDeputyMayorsBarchart01+ylab("Minority Deputy Mayor Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 7))+scale_fill_manual(values = c("CROATIAN"="palegreen3","ITALIAN"="steelblue1","SERBIAN"="mediumpurple1"))


WesternCroatianMinorityDeputyMayorsBarchart02

# Southern Croatia (Dalmatia)

setwd("D:\\Projekt Data Analytics\\POSTGREQSL tablice")

DalmatianAdministrativeUnits=read.csv("Dalmatian Administrative Units.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

#Administrative Units Bar Chart

DalmatianPlot=ggplot(data=DalmatianAdministrativeUnits, aes(x=county))  

DalmatianPlot
DalmatianBarChart=DalmatianPlot+ geom_bar(size=1, aes(fill=administrative_unit_type),color="Black") + theme(axis.text.x = element_text(size = 9))

DalmatianBarChart01=DalmatianBarChart + ylim(0,60)+ylab("Unit Type Count")+xlab("Counties")+scale_fill_manual(values = c("CITY"="gray70", "MUNICIPALITY"="mediumpurple1"
))

DalmatianBarChart01

DalmatianBarChart02=DalmatianBarChart01 + theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + guides(fill=guide_legend(title="Unit Type"))

DalmatianBarChart02

#Incumbents Bar Chart

DalmatianIncumbents=read.csv("Dalmatian Incumbents.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

DalmatianIncumbents                               

DalmatianIncumbentsPlot=ggplot(data=DalmatianIncumbents, aes(x=county))

DalmatianIncumbentsPlot01=DalmatianIncumbentsPlot+geom_bar(size=1, aes(fill=function_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) + ylim(0,200)

DalmatianIncumbentsPlot01

DalmatianIncumbentsPlot02=DalmatianIncumbentsPlot01+ylab("Incumbent Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 8))+ guides(fill=guide_legend(title="Incumbent Function"))

DalmatianIncumbentsPlot02

# Minority Deputy Mayors Bar Chart

DalmatianMinorityDeputyMayors=read.csv("Dalmatian Minorities Deupty Mayors.csv",fileEncoding = "UTF-8-BOM",stringsAsFactors = T)

DalmatianMinorityDeputyMayors

DalmatianMinorityDeputyMayorsBarchart=ggplot(data=DalmatianMinorityDeputyMayors, aes(x=county))

DalmatianMinorityDeputyMayorsBarchart01=DalmatianMinorityDeputyMayorsBarchart+geom_bar(size=1, aes(fill=minority_name),color="Black")+ theme(axis.title  = element_text(size=20)) + theme(legend.title = element_text(size = 15)) +ylim(0,5)

DalmatianMinorityDeputyMayorsBarchart02=DalmatianMinorityDeputyMayorsBarchart01+ylab("Minority Deputy Mayor Count")+xlab("Counties")+ theme(axis.text.x = element_text(size = 7))+ guides(fill=guide_legend(title="Minority Name"))+ theme(axis.text.x = element_text(size = 7))+scale_fill_manual(values = c("CROATIAN"="palegreen3","SERBIAN"="mediumpurple1"))

DalmatianMinorityDeputyMayorsBarchart02