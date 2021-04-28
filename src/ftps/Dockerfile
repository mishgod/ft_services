FROM alpine:3.7
#install packages
RUN apk update
RUN apk upgrade
RUN apk add vsftpd \
            openssl \
            openrc \
            supervisor

#copy configs
COPY supervisord.conf /etc/
COPY vsftpd.conf /etc/vsftpd/

#create user with pass
RUN echo "root:pass" | chpasswd

#create ssl certificate
WORKDIR /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -nodes -x509 -sha256 -days 365 -out /etc/nginx/ssl/private.crt \
    -keyout /etc/nginx/ssl/public.key \
    -subj '/C=RU/ST=Tatarstan/L=Kazan/O=School21 Kazan/OU=rbooker/emailAddress=rbooker@student.21-school.ru'

WORKDIR /
COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh

EXPOSE 20 21 10090

CMD tmp/start.sh