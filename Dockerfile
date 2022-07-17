FROM centos:latest AS base
WORKDIR /app
USER root
RUN set -ex && \
    echo "installing OS dependencies"
RUN pip3 install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
