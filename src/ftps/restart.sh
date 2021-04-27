#!/bin/sh

kubectl delete svc ftps-service
kubectl delete deploy ftps-deployment
eval $(minikube docker-env)
docker build -t ftps_image .
kubectl apply -f ftps.yaml