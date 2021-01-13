FROM library/ubuntu:18.04
MAINTAINER Oleh Kuzovkov <oleh@thirdshelf.com>

USER root

#=====
# Git installation
#=====
RUN apt-get update -qqy \
 && apt-get install git-core -qqy

#=====
# Wget installation
#=====
RUN apt-get update -qqy \
 && apt-get install wget -qqy

##=====
## JAVA JDK installation
##=====
RUN  apt-get update -qqy \
  && apt-get install -qqy default-jre \
  && apt-get install -qqy default-jdk \
  && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment

#=====
# Python 3.8 installation
#=====

RUN  apt-get install -qqy software-properties-common \
  && apt-get update -qqy \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get update -qqy \
  && apt-get install -qqy python3.8

#=====
# Pip 3 installation
#=====
RUN apt-get install python3-pip -qqy

#=====
# Python libraries installation required for the execution
#=====
RUN  python3.8 -m pip install pytest \
  && python3.8 -m pip install pytest-xdist \
  && python3.8 -m pip install pytest-rerunfailures \
  && python3.8 -m pip install appdirs \
  && python3.8 -m pip install allure-pytest \
  && python3.8 -m pip install selenium \
  && python3.8 -m pip install pymysql \
  && python3.8 -m pip install browsermob-proxy \
  && python3.8 -m pip install pysftp \
  && python3.8 -m pip install pyjwt \
  && python3.8 -m pip install docker \
  && python3.8 -m pip install pandas \
  && python3.8 -m pip install xlrd \
  && python3.8 -m pip install jira
