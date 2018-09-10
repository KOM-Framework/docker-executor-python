FROM library/ubuntu:16.04
MAINTAINER Oleh Kuzovkov <oleh@thirdshelf.com>

USER root

#=====
# Git installation
#=====
RUN apt-get update -qqy \
 && apt-get install git-core -qqy

#=====
# JAVA JDK installation
#=====
RUN  apt-get update -qqy \
  && apt-get install -qqy default-jre \
  && apt-get install -qqy default-jdk \
  && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment

#=====
# Python 3.6 installation
#=====

RUN  apt-get install -qqy software-properties-common \
  && apt-get update -qqy \  
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get update -qqy \
  && apt-get install -qqy python3.6

#=====
# Pip 3 installation
#=====
RUN  apt install wget \
  && wget https://bootstrap.pypa.io/get-pip.py \
  && python3.6 get-pip.py

#=====
# Python libraries installation required for the execution
#=====
RUN  python3.6 -m pip install pytest \
  && python3.6 -m pip install pytest-xdist \
  && python3.6 -m pip install appdirs \
  && python3.6 -m pip install allure-pytest \
  && python3.6 -m pip install selenium \
  && python3.6 -m pip install pymysql \
  && python3.6 -m pip install browsermob-proxy \
  && python3.6 -m pip install pysftp \
  && python3.6 -m pip install pyjwt

#=====
# Installing pytest-rerunfailures
#=====
RUN  git clone --single-branch -b "#64-issue-fix" https://github.com/OlegKuzovkov/pytest-rerunfailures.git \
  && cd pytest-rerunfailures \
  && python3.6 setup.py install