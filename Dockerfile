FROM phusion/baseimage:0.9.16
MAINTAINER Elie Sauveterre <contact@eliesauveterre.com>

#ENV PMA_SECRET          blowfish_secret
#ENV PMA_USERNAME        pma
#ENV PMA_PASSWORD        password
#ENV MYSQL_USERNAME      admin
#ENV MYSQL_PASSWORD      password

ENV PHPMYADMIN_VERSION 4.4.9
#ENV MAX_UPLOAD "50M"


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && tar -xvjf /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 -C / \
 && rm /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 \
 && mv /phpMyAdmin-${PHPMYADMIN_VERSION}-english /var/phpmyadmin


VOLUME ["/var/phpmyadmin"]

CMD ["true"]
