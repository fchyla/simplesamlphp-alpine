#!/bin/sh

# Change apache config
sed -i 's/ServerAdmin\ you@example.com/ServerAdmin\ admin@example.com/' /etc/apache2/httpd.conf

# Enable apache modules
sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf

# Modify php.ini
sed -i 's/memory_limit = .*/memory_limit = 256M/' /etc/php7/php.ini
sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Amsterdam\"/" /etc/php7/php.ini
