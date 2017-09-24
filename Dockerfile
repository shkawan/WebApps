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

RUN apt-get install openssh-server -y
COPY sshd_config /etc/ssh
# RUN /etc/init.d/ssh start

RUN git clone git@github.com:shkawan/WebApps.git webapps
COPY docker-exec.sh webapps
WORKDIR /webapps
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# ログ用のディレクトリのmount
VOLUME /docker


CMD [ "./docker-exec.sh" ]

