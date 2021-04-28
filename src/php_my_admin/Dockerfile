FROM alpine:3.12
#install packages
RUN apk update
RUN apk upgrade
RUN apk add wget \
            nginx \
            php7-fpm \
            php7-mcrypt \
            php7-soap \
            php7-openssl \
            php7-gmp \
            php7-pdo_odbc \
            php7-json \
            php7-dom \
            php7-pdo \
            php7-zip \
            php7-mysqli \
            php7-sqlite3 \
            php7-apcu \
            php7-pdo_pgsql \
            php7-bcmath \
            php7-gd \
            php7-odbc \
            php7-pdo_mysql \
            php7-pdo_sqlite \
            php7-gettext \
            php7-xmlreader \
            php7-xmlrpc \
            php7-bz2 \
            php7-iconv \
            php7-pdo_dblib \
            php7-curl \
            php7-ctype \
            php7-mbstring \
            php7-session \
            supervisor

#download PhpMyAdmin
WORKDIR /var/www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages phpmyadmin
RUN ln -s /var/www/phpmyadmin /var/www/localhost/htdocs/phpmyadmin
COPY ./config.inc.php ./phpmyadmin/
RUN chown -R 755 /var/www/
#copy configs
WORKDIR /
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

COPY ./start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN chmod -R 777 /var/lib/php7
RUN chmod -R 777 /var/lib/nginx

EXPOSE 5000

CMD ["/tmp/start.sh"]