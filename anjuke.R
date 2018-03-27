rm(list=ls())
gc()
library(xml2)
library(rvest)
library(stringr)
# maxp <-5780

web<-paste("https://nb.anjuke.com/sale/yinzhou/p",c(1:5),"-t105/#filtersort",sep="")
for(i in c(1:100)){
  
  words<-read_html(web[i],encoding="UTF-8")
  
  #v1<-words%>%html_nodes(".sale-left") %>% html_nodes(".over-bg") %>% data.frame()
  v1<-words%>%html_nodes(".sale-left") %>% html_nodes(".details-item")%>%html_text()
  v2<-words%>%html_nodes(".sale-left") %>% html_nodes(".price-det")%>%html_text()%>%str_replace_all("万","")%>%as.numeric()
  records<-matrix(rep(NA,11),ncol=11)%>%as.data.frame()
  
  if(length(v1)!=2*length(v2)) stop("youwenti")
  
  for(j in seq(1,length(v1),by=2)){
    
    x1<-str_replace_all(v1[j],"[\n]","")%>%str_trim()
    x2<-str_replace_all(v1[j+1],"[\n]+\n","")%>%str_trim()%>%str_replace_all("\u00A0","")%>%str_replace_all(" ","")
    
    x1.list<-unlist(str_split(x1,"[|]"))
    x2.list<-unlist(str_split(x2,"[\n]"))
    shiting<-as.numeric(unlist(str_extract_all(x1.list[1],"\\d")))
    shi<-shiting[1]
    ting<-shiting[2]
    mianji<-as.numeric(str_extract_all(x1.list[2],"[\\d]+\\d"))
    louling<-as.numeric(str_extract_all(x1.list[4],"[\\d]+\\d"))
    lougao<-str_extract_all(x1.list[3],"\\d")%>%unlist()%>%paste(collapse = "")%>%as.numeric()
    louceng<-str_sub(x1.list[3],1,2)
    jingjiren <- str_sub(x1.list[4],start=-3) %>% str_replace("\n","")
    xiaoqu<-x2.list[1]
    dizhi<- x2.list[2]%>%str_split("-")%>%unlist()
    qu<-dizhi[1]
    bankuai<-dizhi[2]
    jutidizhi<-dizhi[3]
    
    record<-c(shi,ting,mianji,louling,lougao,louceng,xiaoqu,qu,bankuai,jutidizhi,price=v2[j])
    records<-rbind(records,record)
  }
  # x1<-str_replace(v1[1],"[\n]","")%>%str_replace(" ","")%>%str_trim()

}

write.csv(records,"D:/records.csv")
