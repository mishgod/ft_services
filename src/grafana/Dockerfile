FROM alpine:3.12
#install packages
RUN apk update
RUN apk upgrade
RUN apk add wget

#download grafana and glibs
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz
RUN tar -xzf grafana-7.5.4.linux-amd64.tar.gz
RUN rm -rf grafana-7.5.4.linux-amd64.tar.gz
#copy config
COPY supervisord.conf /etc/
COPY start.sh /tmp/
#copy database(grafana dashboards and datasources)
RUN mkdir -p /grafana-7.5.4/data
COPY grafana.db /grafana-7.5.4/data/grafana.db

RUN ln -s grafana-7.5.4/bin/grafana-server ./grafana-server

EXPOSE 3000

CMD sh tmp/start.sh

#kubectl cp grafana-deployment-6ccdf5bbbf-nvtgw:grafana-7.5.4/data/grafana.db ./grafana.db - get grafana.bd from container. Don't forget edit pod's name!
#user = admin, pass = admin - default