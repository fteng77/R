rm(list=ls())
gc()
library("xml2")
library("rvest")
library(stringr)
web0<-paste("http://www.baoxianguancha.com/list-13-",1:8,".html",sep="")
y<-list()

for (j in 1:8) {
  web<-read_html(web0[j])
  web1 <- web %>% html_nodes(xpath="/html/body/section/div[2]/div[1]/div/div[2]/div") 
  n<-length(web1)
  
  for (i in 1:n){
    y1<-list()
    http1<-"/html/body/section/div[2]/div[1]/div/div[2]/div["
    http2.name <-"]/div[1]/div[2]/div[1]/a"#company name
    http2.intro<-"]/div[1]/div[2]/div[2]"
    http2.founder<-"]/div[2]"
    http2.address<-"]/div[4]"
    http2.fin<-"]/div[5]"
    http2.label<-"]/div[3]"
    
    http<-paste(http1,i,c(http2.name,
                          http2.intro,
                          http2.founder,
                          http2.address,
                          http2.fin,
                          http2.label),sep="")
    
    name<-html_nodes(web1[[i]],xpath=http[1])%>%html_text()
    #web2<-html_nodes(web1[[i]],xpath=http[1])%>%html_attrs()<-unlist()[2]
    introduction<-html_nodes(web1[[i]],xpath=http[2])%>%html_text()
    founder<-html_nodes(web1[[i]],xpath=http[3])%>%html_text()%>%str_trim(side="both")  #str_trim(string, side = c("both", "left", "right"))
    address<-html_nodes(web1[[i]],xpath=http[4])%>%html_text()%>%str_trim(side="both")
    fin<-html_nodes(web1[[i]],xpath=http[5])%>%html_text()%>%str_trim(side="both")
    label<-html_nodes(web1[[i]],xpath=http[6])%>%html_children()%>%html_text()
    
    y1[[i]] <-c(name,introduction,founder,address,fin,label[1],label[3])
    
  }
  y<-c(y,y1)
}

