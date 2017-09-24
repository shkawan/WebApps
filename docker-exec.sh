#!/bin/bash
# echo "root:Docker!" | chpasswd
# /etc/init.d/ssh start
gunicorn -w 2 -b 0.0.0.0:80 main:app --log-level=info --log-file=/docker/gunicorn.log --access-logfile=/docker/gunicorn-access.log
