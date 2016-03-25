docker-symfony
==============


Just a litle Docker POC in order to have a complete stack for running Symfony into Docker containers using docker-compose tool.

# Installation

First, clone this repository:

```bash
$ git clone git@github.com:jovobe/docker-symfony.git
```

Next, add `symfony.dev` in your `/etc/hosts` file.

Then, run:

```bash
$ docker-compose up
```

Now Your environment is ready to use. You can upload Your code via SFTP service
at symfony.dev:2222 with root directory /symfony/.

You are done, you can visite your Symfony application on the following URL: `http://symfony.dev`

_Note :_ you can rebuild all Docker images by running:

```bash
$ docker-compose build
```

# How it works?

Here are the `docker-compose` built images:

* `application`: This is the Symfony application code container,
* `phpmyadmin`: This is the phpMyAdmin application code container,
* `db`: This is the MySQL database container (can be changed to postgresql or whatever in `docker-compose.yml` file),
* `php`: This is the PHP-FPM container in which the application volume is mounted,
* `sftp`: This is the SFTP container in which the application volume is mounted and the SFTP server lifes,
* `nginx`: This is the Nginx webserver container in which application volume is mounted too

This results in the following running containers:

```bash
> $ docker-compose ps
        Name                          Command                 State   Ports
        -------------------------------------------------------------------------------------------
        dockersymfony_application_1   /bin/bash               Up                                  
        dockersymfony_db_1            /entrypoint.sh mysqld   Up      0.0.0.0:3306->3306/tcp      
        dockersymfony_nginx_1         nginx                   Up      443/tcp, 0.0.0.0:80->80/tcp
        dockersymfony_php_1           php5-fpm -F             Up      0.0.0.0:9000->9000/tcp      
        dockersymfony_phpmyadmin_1    /bin/bash               Up
        dockersymfony_sftp_1          /sftp.sh                Up      0.0.0.0:2222->22/tcp
```
