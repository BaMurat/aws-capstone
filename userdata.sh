#!/bin/bash
apt-get update -y
apt-get install git -y
apt-get install python3 -y
cd /home/ubuntu/
TOKEN="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"
GTUSER="BaMurat"
REPO="aws-capstone"
git clone https://$GTUSER:$TOKEN@github.com/BaMurat/$REPO.git
cd /home/ubuntu/$REPO
apt install python3-pip -y
apt-get install python3.7-dev default-libmysqlclient-dev -y
pip3 install -r requirements.txt
cd /home/ubuntu/$REPO/src
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:80
