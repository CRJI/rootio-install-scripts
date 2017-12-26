#!/bin/bash
## set up freeswitch on debian jessie for root.io

set -e
set -x

sudo apt-get install virtualenv postgresql postgresql-server-dev-all build-essential libpython-dev libzmq3-dev -y
sudo -u postgres createuser -s jessie
sudo -u jessie createdb rootio

cd ~
mkdir venvs
git clone https://github.com/mgax/rootio-test-media media
git clone https://github.com/rootio/rootio_web

cd rootio_web

virtualenv ../venvs/web
source ../venvs/web/bin/activate
pip install -r requirements.txt

mkdir instance instance/log


cat > instance/rootio.cfg <<ROOTIO_CFG
from pathlib import Path
instance = Path(__file__).resolve().parent
root = instance.parent
PROJECT_ROOT = str(root)
SQLALCHEMY_DATABASE_URI = 'postgres:///rootio'
LOG_FOLDER = str(instance / 'log')
MAIL_SERVER = 'smtp.example.com'
MAIL_USE_TLS = False
MAIL_USE_SSL = False
SECRET_KEY = 'some random secret'
PROJECT = 'Rootio Web'
ADMINS = ['admin@example.com']
DEBUG = True
MEDIA_PREFIX = '/home/jessie/media'
ROOTIO_CFG

./manage.py reset_db

./manage.py demo_data
