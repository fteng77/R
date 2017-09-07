library(xml2)
library(rvest)

#参考文献：http://blog.csdn.net/wshsa/article/details/74157341

####第一步：收集报表连接
####读取表名和超级链接
web1<-c("http://www.circ.gov.cn/web/site0/tab5201/module14497/page")
web2<-c(".htm")
pages<-12
web.data<-data.frame()

for(i in 1:pages){
  web<-paste(web1,i,web2,sep="")
  web <- read_html(web,encoding = "UTF-8")
  web.txt<-web%>%html_nodes('div.muban1bottom td.hui14 a')%>%html_text()
  web.link<-web%>%html_nodes('div.muban1bottom td.hui14 a')%>%html_attr("href")
  circ<-rep("http://www.circ.gov.cn",length(web.link))
  web.link<-paste(circ,web.link,sep="")
  web<-cbind(name=web.txt,link=web.link)
  web.data<-rbind(web.data,web)
}
length(web.data)
head(web.data)

#v2<-data.frame()
n<-length(web.data$link)
v1<-list()
#n<-10
####第二步：收集数据
for(i in 1:n){
  www<-read_html(as.character(web.data$link[i]),encoding = "UTF-8")
  v1[[i]]<-www %>% html_nodes("table.MsoTableGrid") %>% html_table() %>% data.frame()
}


