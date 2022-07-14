FROM <Image>:<tag> AS base
WORKDIR /app
USER root
RUN set -ex && \
    echo "installing OS dependencies" && \
    yum update -y && \
    yum install -y gcc make python3-pip epel-release python-matplotlib && \
    yum clean all
RUN pip3 install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
