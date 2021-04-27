#!/bin/sh

kubectl delete svc nginx-service
kubectl delete deploy nginx-deployment
eval $(minikube docker-env)
docker build -t nginx_image .
kubectl apply -f nginx.yaml