library(xml2)
library(rvest)
# maxp <-5780
v2<-data.frame()
for (i in 1:1000){
  webstr <- paste("http://www.cbalicai.com/producttoIndex.do?page.pageNo=" , i,sep="")
  words <- read_html(webstr,encoding = "UTF-8")
  v2 <- rbind(v2,words %>% html_nodes("table") %>% html_table() %>% data.frame())
}
write.csv(v2,"F:/finance1000.csv")
