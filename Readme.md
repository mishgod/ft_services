# ft_services

## Description 

This project consist to clusturing an docker-compose application and deploy it with Kubernetes. 

Project has 7 services. Each service will have to run in a dedicated container. 
Containers are build using Alpine Linux. The Load Balancer manages the external access of services.

## Information about containers

### Nginx

A container with nginx server listening on ports 80 and 443. Port 80 is in
http and has a systematic redirection of type 301 to 443 (https).

### phpMyAdmin

• phpMyAdmin is listening on port 5000 and linked with the MySQL database. PhpMyAdmin has its own nginx server. 
The Load Balancer is able to redirect directly to this service.

### WordPress and MySQL

• A WordPress website listening on port 5050, which works with a MySQL database.
Both services  have run in separate containers. The WordPress website has
several users and an administrator. Wordpress needs its own nginx server. The
Load Balancer is able to redirect directly to this service.

### FTPS

• A FTPS server listening on port 21.

## Grafana

• A Grafana platform, listening on port 3000, linked with an InfluxDB database.
Grafana is monitoring all containers. one dashboard per service has created.


## In case of crash or stop

• In case of a crash or stop of one of the two database containers, the data persist.

• All  containers restarts in case of a crash or stop of one of its component
parts.


## Using

Before starting, you need to install minikube and VirtualBox

Use `bash setup.sh` in terminal to launch. This script will setup
all applications. 