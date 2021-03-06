#!/usr/bin/python
# -*- coding: utf-8 -*-
from bottle import route,run,request,response,redirect,default_app
# import requests
import os
import datetime
import json

@route('/hello/:name')
def _hello(name):
  return "<h1>Hello {0}</h1>".format(name)

@route('/datetime')
def _datetime():
  response.content_type = 'application/json'
  return json.dumps( { 'datetime' : datetime.datetime.now().strftime("%Y/%m/%dT%H:%M:%S") } )

@route('/env/:name')
def _env(name):
  env = os.environ
  value = env.get(name)
  response.content_type = 'application/json'
  return json.dumps( { name : value } )

@route('/')
def _root():
  return "これは標準です"

@route('/test')
def _test():
  return "ok"


app = default_app()

if __name__ == '__main__':
  port = os.environ.get("APP_PORT", 28000)
  run(host='0.0.0.0', port=port, reloader=True)
