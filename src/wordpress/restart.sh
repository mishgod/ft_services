#!/bin/sh

kubectl delete svc wordpress-service
kubectl delete deploy wordpress-deployment
eval $(minikube docker-env)
docker build -t wordpress_image .
kubectl apply -f wordpress.yaml