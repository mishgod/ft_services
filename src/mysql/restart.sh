#!/bin/sh

kubectl delete svc mysql-service
kubectl delete deploy mysql-deployment
eval $(minikube docker-env)
docker build -t mysql_image src/mysql
kubectl apply -f src/mysql/mysql.yaml