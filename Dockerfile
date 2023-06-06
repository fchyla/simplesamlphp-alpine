# docker build -t simplesamlphp .

FROM alpine:3
LABEL maintainer="filip@chy.la"
LABEL description="SimpleSAMLphp application on Alpine based image with apache2 and php7."

# Setup apache and php
RUN apk --no-cache \
    add apache2 \
    curl \
    php7-apache2 \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-session \
    php7-xml \
    php7-xmlrpc \
    php7-zlib \
    && mkdir /run/apache2 \
    && mkdir -p /opt/utils \
    && mkdir /htdocs

EXPOSE 80

COPY  setup_apache.sh /opt/

RUN cd /htdocs && wget --no-check-certificate https://simplesamlphp.org/download\?latest && tar xvzf download\?latest && mv simplesamlphp-* simplesamlphp

RUN chmod +x /opt/setup_apache.sh && /opt/setup_apache.sh && rm /opt/setup_apache.sh

COPY 000-default.conf /etc/apache2/conf.d/sso.conf

ENTRYPOINT ["httpd","-D","FOREGROUND"]
