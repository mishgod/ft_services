FROM alpine:3.12
#install packages
RUN apk update
RUN apk upgrade
RUN apk add influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/ \
            supervisor \
            telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

#copy configs
COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/

#setup telegraf
RUN usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > etc/telegraf/telegraf.conf

VOLUME ["/var/lib/influxdb"]

EXPOSE 8086

CMD /usr/bin/supervisord -c /etc/supervisord.conf