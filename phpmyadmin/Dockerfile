FROM ubuntu:15.10

MAINTAINER Johan M. von Behren <johan@vonbehren.eu>

ENV PHPMYADMIN_VERSION 4.6.0

RUN apt-get update && apt-get install -y wget

RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz \
 && tar xfz phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz \
 && rm phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz \
 && mkdir /var/www \
 && mv phpMyAdmin-${PHPMYADMIN_VERSION}-english /var/www/phpmyadmin \
 && chown -R www-data:www-data /var/www/phpmyadmin

RUN cp /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php \
  && sed -i "s/\['host'\]\s*=\s*'localhost'/['host']='db'/" /var/www/phpmyadmin/config.inc.php

VOLUME /var/www/phpmyadmin
