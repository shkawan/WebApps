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

COPY dummy tmp
RUN git clone https://github.com/shkawan/WebApps.git webapps

WORKDIR /webapps
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# ログ用のディレクトリのmount
VOLUME /docker

CMD ["gunicorn", "-w 2", "-b 0.0.0.0:80", "app:app", "--log-level=info", "--log-file=/docker/gunicorn.log", "--access-logfile=/docker/gunicorn-access.log"]

