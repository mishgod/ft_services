#!/bin/sh

kubectl delete svc influxdb-service
kubectl delete deploy influxdb-deployment
eval $(minikube docker-env)
docker build -t influxdb_image .
kubectl apply -f influxdb.yaml