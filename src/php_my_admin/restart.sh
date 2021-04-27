#!/bin/sh

kubectl delete svc php-my-admin-service
kubectl delete deploy php-my-admin-deployment
eval $(minikube docker-env)
docker build -t php_my_admin_image .
kubectl apply -f php_my_admin.yaml