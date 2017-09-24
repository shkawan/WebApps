FROM appcontainers/ubuntu
# FROM ubuntu:latest
MAINTAINER Shingo Kawano <shingo.ms@55mp.com>

RUN apt-get update
RUN apt-get install -y python-dev
RUN apt-get install -y gcc
RUN apt-get install python-pip -y
RUN apt-get install curl -y
RUN apt-get install vim -y
RUN apt-get install git -y

RUN git clone https://github.com/shkawan/WebApps.git
COPY docker-exec.sh webapps
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
WORKDIR /webapps

# ログ用のディレクトリのmount
VOLUME /docker

CMD ["./docker-exec.sh"]

