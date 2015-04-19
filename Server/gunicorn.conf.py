import os

proc_name = 'appname'
bind = 'unix:/tmp/appname.gunicorn.sock'
backlog = 2048
worker_class = 'gevent'
workers = max(os.sysconf('SC_NPROCESSORS_ONLN') * 2 + 1, 3)
worker_connections = 1000
timeout = 30
keepalive = 2

