FROM library/ubuntu:16.04
MAINTAINER Oleh Kuzovkov <oleh@thirdshelf.com>

USER root

#=====
# JAVA JDK installation
#=====
RUN  apt-get update -qqy \
  && apt-get install -qqy default-jre \
  && apt-get install -qqy default-jdk \
  && echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment

#=====
# Python 3.5 installation
#=====

RUN  apt-get install -qqy software-properties-common python-software-properties \
  && apt-get update -qqy \
  && add-apt-repository ppa:fkrull/deadsnakes \
  && apt-get update -qqy \
  && apt-get install -qqy python3.5

#=====
# Pip 3 installation
#=====
RUN  apt-get install -qqy python3-pip --upgrade \
  && pip3 install --upgrade pip

#=====
# Python libraries installation required for framework execution
#=====
RUN  pip3 install --upgrade appdirs \
  && pip3 install --upgrade allure-pytest \
  && pip3 install --upgrade selenium \
  && pip3 install --upgrade pymysql \
  && pip3 install --upgrade browsermob-proxy \
  && pip3 install --upgrade pysftp
