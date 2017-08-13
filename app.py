#!/usr/bin/python
# -*- coding: utf-8 -*-
from bottle import route,run,request,response,redirect,default_app
# import requests
import os
import datetime

@route('/hello/:name')
def hello(name):
  return "<h1>Hello {0}</h1>".format(name)

@route('/datetime')
def _datetime():
  return datetime.datetime.now().strftime("%Y/%m/%dT%H:%M:%S")

if __name__ == '__main__':
  port = os.environ.get("APP_PORT", 8080)
  run(host='0.0.0.0', port=port, reloader=True)
