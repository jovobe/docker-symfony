FROM ubuntu:15.10

MAINTAINER Johan M. von Behren <johan@vonbehren.eu>

RUN apt-get update \
  && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl

RUN apt-get update \
  && apt-get install -y git

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
  && php composer-setup.php && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y wget \
  && wget https://phar.phpunit.de/phpunit-old.phar \
  && chmod +x phpunit-old.phar \
  && mv phpunit-old.phar /usr/local/bin/phpunit

RUN mkdir /var/www \
  && cp /root/.bashrc /var/www/ \
  && cp /root/.profile /var/www/ \
  && chown -R www-data:www-data /var/www

ADD symfony.ini /etc/php5/fpm/conf.d/
ADD symfony.ini /etc/php5/cli/conf.d/

ADD symfony.pool.conf /etc/php5/fpm/pool.d/

RUN chsh -s /bin/bash www-data

CMD ["php5-fpm", "-F"]

EXPOSE 9000
