FROM debian:bullseye

RUN apt-get update && \
    apt install unzip php curl \
    wget redis php-redis php-mysqli \
    php-fpm php-cgi php-curl php-gd \
    php-mbstring php-xml php-xmlrpc php-soap \
    php-intl php-zip -y && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt install default-mysql-client -y

RUN mkdir /run/php

# RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
# RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY tools/wpscript.sh /
RUN chmod +x /wpscript.sh

EXPOSE  9000

ENTRYPOINT [ "/wpscript.sh" ]