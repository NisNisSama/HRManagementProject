#!/bin/bash

exec >> /home/nisaina/deploy.log 2>&1

echo "== Deploy Front $(date) =="

cd /home/nisaina
if [ ! -d "/home/nisaina/HRManagementProject" ]; then
	git clone -v git@github.com:NisNisSama/HRManagementProject.git
	cd HRManagementProject
else
	cd HRManagementProject
	git pull -v
fi

rsync -av --delete /home/nisaina/HRManagementProject/Front/ /opt/tomcat/webapps/ROOT/

echo "== Deploy Finish =="
