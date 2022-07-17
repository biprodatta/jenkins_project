FROM centos:7 AS base
WORKDIR /app
USER root
RUN set -ex && \
    echo "installing OS dependencies" && \
    yum install -y gcc make python3-pip epel-release python-matplotlib && \
    yum clean all
RUN pip3 install --upgrade pip
RUN yum -y remove java
RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel

RUN yum install -y maven
RUN yum install -y curl 
RUN yum install -y unzip
COPY requirements.txt .
RUN pip install -r requirements.txt
