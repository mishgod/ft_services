#!/bin/bash

kubectl delete svc nginx-service && kubectl delete deploy nginx-deployment
kubectl delete svc php-my-admin-service && kubectl delete deploy php-my-admin-deployment
kubectl delete svc wordpress-service && kubectl delete deploy wordpress-deployment
kubectl delete svc mysql-service && kubectl delete deploy mysql-deployment
kubectl delete svc ftps-service && kubectl delete deploy ftps-deployment
kubectl delete svc influxdb-service && kubectl delete deploy influxdb-deployment
kubectl delete svc grafana-service && kubectl delete deploy grafana-deployment
minikube stop
minikube delete