#!/bin/bash
#ln -s /goinfre/rbooker .minikube
echo "minikube is starting"
minikube start --vm-driver=virtualbox --cpus 2 --memory 3000
echo "minikube started"
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb
kubectl apply -f src/metallb.yaml
docker build -t nginx_image src/nginx
kubectl apply -f src/nginx/nginx.yaml
docker build -t mysql_image src/mysql
kubectl apply -f src/mysql/mysql.yaml
docker build -t php_my_admin_image src/php_my_admin
kubectl apply -f src/php_my_admin/php_my_admin.yaml
docker build -t wordpress_image src/wordpress
kubectl apply -f src/wordpress/wordpress.yaml
docker build -t ftps_image src/ftps
kubectl apply -f src/ftps/ftps.yaml
docker build -t influxdb_image src/influxdb
kubectl apply -f src/influxdb/influxdb.yaml
docker build -t grafana_image src/grafana
kubectl apply -f src/grafana/grafana.yaml
minikube dashboard
