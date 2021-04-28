FROM alpine:3.12

#install packages
RUN apk update
RUN apk upgrade
RUN apk add nginx \
            openssl \
            supervisor

#copy configs
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf

#creating ssl certificate
WORKDIR /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -nodes -x509 -sha256 -days 365 -out /etc/nginx/ssl/private.crt \
    -keyout /etc/nginx/ssl/public.key \
    -subj '/C=RU/ST=Tatarstan/L=Kazan/O=School21 Kazan/OU=rbooker/emailAddress=rbooker@student.21-school.ru'

WORKDIR /
COPY ./start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["/tmp/start.sh"]