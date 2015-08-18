FROM phusion/baseimage:0.9.16
MAINTAINER Elie Sauveterre <contact@eliesauveterre.com>

ENV PMA_SECRET       blowfish_secret
ENV PHPMYADMIN_VERSION 4.4.9

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && tar -xvjf /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 -C / \
 && rm /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && mv /phpMyAdmin-${PHPMYADMIN_VERSION}-english /var/phpmyadmin

ADD config.inc.php /var/phpmyadmin/
ADD phpmyadmin-start /usr/local/bin/

RUN chmod +x /usr/local/bin/phpmyadmin-start

VOLUME ["/var/phpmyadmin"]

CMD phpmyadmin-start
