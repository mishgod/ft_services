FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add wget \
            nginx \
            php7-fpm \
            php7-common \
            php7-session \
            php7-iconv \
            php7-json \
            php7-gd \
            php7-curl \
            php7-xml \
            php7-mysqli \
            php7-imap \
            php7-cgi \
            fcgi \
            php7-pdo \
            php7-pdo_mysql \
            php7-soap \
            php7-xmlrpc \
            php7-posix \
            php7-mcrypt \
            php7-gettext \
            php7-ldap \
            php7-ctype \
            php7-dom \
            supervisor

WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
RUN chown -R 755 /var/www
RUN ln -s /var/www/wordpress/ /var/www/localhost/htdocs/wordpress
COPY wp-config.php ./wordpress/
RUN chown -R 755 /var/www/

WORKDIR /
COPY nginx.conf /etc/nginx/conf.d/
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/

RUN mkdir -p /run/nginx
#RUN mkdir -p /run/wordpress
RUN chmod -R 777 /var/lib/nginx

EXPOSE 5050

CMD supervisord -c /etc/supervisord.conf