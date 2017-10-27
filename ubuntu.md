# 如何在Ubuntu16.04中安装最新版的R

## Step1: 使用ctrl+alt+t打开terminal，输入“sudo gedit etc/apt/sources.list”
## step2: 在sources.list的最后一行加入“deb https://mirrors.ustc.edu.cn/CRAN/bin/linux/ubuntu xenial/”，并保存退出
## step3: 在terminal依次输入
- sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
- sudo apt-get update
- sudo apt-get install r-base
- sudo R

## 参考文献：
1. http://blog.csdn.net/lzz360/article/details/46994359
1. http://blog.csdn.net/wzgl__wh/article/details/53440607

# 如何在ubuntu16.04中安装Rstudio
## 输入sudo apt-get install gdebi-core
## 转到deb包的文件夹，如：cd /home/tony/下载
## 安装命令：sudo gdebi -n rstudio-xenial-1.1.383-amd64.deb

## 参看文献：
1. http://blog.csdn.net/duxu24/article/details/53611510

