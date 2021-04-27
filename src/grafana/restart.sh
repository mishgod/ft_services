#!/bin/sh

kubectl delete svc grafana-service && kubectl delete deploy grafana-deployment
eval $(minikube docker-env)
docker build -t grafana_image .
kubectl apply -f grafana.yaml
minikube dashboard