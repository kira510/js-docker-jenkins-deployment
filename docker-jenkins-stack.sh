#!/bin/sh


#get date in iso format
DATE=$(date -I)


docker build --no-cache -t kee10crazyforfootball/jenkins:$DATE .

docker tag  kee10crazyforfootball/jenkins:$DATE kee10crazyforfootball/jenkins:lts

docker tag  kee10crazyforfootball/jenkins:$DATE kee10crazyforfootball/jenkins:latest

docker push kee10crazyforfootball/jenkins:$DATE
docker push kee10crazyforfootball/jenkins:lts
docker push kee10crazyforfootball/jenkins:latest


docker stack deploy -c docker-compose.yml jenkins

