library(ggplot2)
library(dplyr)
library(Hmisc)

setwd("~/INCC") # Define directorio trabajo

filenames <- list.files(pattern="*.csv")
allData   <- read.csv(filenames,sep=",", fill = T)
colnames(allData) <- c("sujeto","género","Cue","ImgDer","ImgIzq","RespCue","Respuesta","RtaEsperada","RespTime")
str(allData)

allData<- allData %>%
  filter(Cue !=-1)

# Histograma de tipos de rtas general

ggplot(allData, aes(x=Respuesta)) + 
  geom_histogram()

#Separo los datos del exp "normal" 

AllDataN <- allData %>%
  filter(ImgDer<17 & ImgIzq<17)

#Respuesta de todos los ensayos para cada sujeto

ggplot(AllDataN, aes(x=as.factor(sujeto) , y=RespTime, color=as.factor(género))) + 
  geom_point() + 
  stat_summary(fun.data = "mean_se",color="black")   #### CHEQUEAR!! #### 

trial<-c()
for (i in 1:16){
     trial[i] <- rep(sum(AllDataN$sujeto==i))
  }


plot(x=c(1:16),y=trial, ylim=c(0,50))



ggplot(AllDataN, aes(x=as.factor(sujeto), y=RespTime)) + 
  geom_point() + facet_grid(.~género)


ggplot(AllDataN, aes(x= , y=RespTime)) + 
  geom_line() + facet_grid(.~género)

#Histograma de rtas para los normales

ggplot(AllDataN, aes(x=Respuesta)) + 
  geom_histogram()

#Elimino las rtas invalidas

AllDataN<- AllDataN %>% 
  filter(Respuesta!="-1")

#Grafico rtas segun cue atencional 

#Filas validas/neutrales/invalidas respecto de las posiciones del cue.

AllDataN <- AllDataN %>% 
 mutate (RespCorrecta= Respuesta == RtaEsperada) %>%
 mutate (Validas = Cue==1 & RespCue==1 | Cue==3 & RespCue==2) %>%
 mutate (Neutrales = Cue ==2) %>%
 mutate (Invalidas= Cue==1 & RespCue==2 | Cue==3 & RespCue==1) %>%
  
 mutate (CueAt= ifelse(Validas == TRUE , "valido", ifelse(Neutrales == TRUE, "neutral", "invalido"))) %>%

 mutate(HH=ImgDer < 9 & ImgIzq < 9,
        HM=ImgDer > 8 & ImgDer < 17 & ImgIzq < 9,
        MH=ImgDer <9 & ImgIzq > 8 & ImgIzq < 17,
        MM=ImgIzq > 8 & ImgIzq < 17 & ImgDer > 8 & ImgDer < 17) %>%

 mutate(Pares=ifelse(HH== TRUE, "HH",
             ifelse(HM== TRUE, "HM",
             ifelse(MH== TRUE, "MH",
             "MM"))))  %>%
  
 mutate (H_HH= género==1 & ImgDer < 9 & ImgIzq < 9, 
         H_HM= género==1 & ImgDer > 8 & ImgDer < 17 & ImgIzq < 9 & RespCue==1 | 
               género==1 & ImgDer < 9 & ImgIzq > 8 & ImgIzq < 17 & RespCue==2,
         H_MH= género==1 & ImgDer <9 & ImgIzq > 8 & ImgIzq < 17 & RespCue==1  | 
               género==1 & ImgIzq < 9 & ImgDer > 8 & ImgDer< 17 & RespCue==2,
         H_MM= género==1 & ImgIzq > 8 & ImgIzq < 17 & ImgDer > 8 & ImgDer < 17,
         
         M_HH= género==0 & ImgDer < 9 & ImgIzq < 9, 
         M_HM= género==0 & ImgDer > 8 & ImgDer < 17 & ImgIzq < 9 & RespCue==1 | 
               género==0 & ImgDer < 9 & ImgIzq > 8 & ImgIzq < 17 & RespCue==2,
         M_MH= género==0 & ImgDer <9 & ImgIzq > 8 & ImgIzq < 17 & RespCue==1  | 
               género==0 & ImgIzq < 9 & ImgDer > 8 & ImgDer< 17 & RespCue==2,
         M_MM= género==0 & ImgIzq > 8 & ImgIzq < 17 & ImgDer > 8 & ImgDer < 17) %>%

 mutate (M_Target= ifelse(M_HH == TRUE , "M_HH", 
                  ifelse(M_HM == TRUE, "M_HM", 
                  ifelse(M_MH==TRUE,"M_MH", 
                  "M_MM")))) %>%
 mutate (H_Target= ifelse(H_HH == TRUE , "H_HH", 
                  ifelse(H_HM == TRUE, "H_HM", 
                  ifelse(H_MH==TRUE,"H_MH", 
                  "H_MM"))))


#Histograma de respuestas correctas segun el cue atencional

ggplot(AllDataN, aes(x=CueAt)) +
  geom_bar(aes(fill=RespCorrecta))

library(scales)

ggplot(AllDataN, aes(CueAt,fill=RespCorrecta)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)) + 
  scale_y_continuous(labels = percent_format())




ggplot(AllDataN, aes(CueAt,fill=RespCorrecta)) + 
  geom_bar(aes(y = c(..count..[..group..==1]/(..count..),
                     ..count..[..group..==2]/(..count..)), position='dodge')) 
+
  ylab("Percentage") + xlab("CueAt")

                     ..count..[..group..==2]/sum(..count..[..group..==2]),
                     ..count..[..group..==3]/sum(..count..[..group..==3]))*100),
           position='dodge'), binwidth=0.5) +
  ylab("Percentage") + xlab("CueAt")






#Boxplot separando rtas por genero
ggplot(AllDataN, aes(x=CueAt, y=RespTime)) +
 # geom_point() +
  geom_boxplot()+
#   stat_summary(fun.data= mean_sdl, geom="crossbar")+
  facet_grid(RespCorrecta~género)

ggplot(AllDataN, aes(x=CueAt, y=RespTime)) +
  stat_summary(fun.data= mean_sdl, geom="point") +
  facet_grid(RespCorrecta~género)




#Grafica cantidad de pares presentados por género

ggplot(AllDataN, aes(x=Pares)) +
  geom_bar() +
  facet_grid(.~género)

#Grafica rtas correctas e incorrectas para sujetos mujeres vs distintas comb de caras

ggplot(AllDataN, aes(x=RespCorrecta)) +
  geom_bar(aes(fill=M_Target), position = "dodge")


#Boxplot separando rtas por target
ggplot(AllDataN, aes(x=M_Target, y=RespTime)) +
geom_boxplot()
  
#Grafica rtas correctas e incorrectas para sujetos mujeres vs distintas comb de caras

ggplot(AllDataN, aes(x=RespCorrecta)) +
  geom_bar(aes(fill=H_Target), position = "dodge")
  

#Boxplot separando rtas por target
ggplot(AllDataN, aes(x=H_Target, y=RespTime)) +
geom_boxplot()



################
#DISTORCIONADOS!
################

AllDataD <- allData %>%
  filter (ImgDer>16 | ImgIzq>16)
  

ggplot(AllDataD, aes(x=as.factor(sujeto) , y=RespTime, color=as.factor(género))) + 
  geom_point()

ggplot(AllDataD, aes(x=Respuesta)) + 
  geom_histogram()

