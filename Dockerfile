FROM debian
RUN apt-get update && apt-get install apache2 wget unzip php libapache2-mod-php php-mysql php-curl php-gd php-pear php-imagick php-imap php-mcrypt php-recode php-tidy php-xmlrpc -y 
RUN cd /tmp/ && wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf /tmp/latest.tar.gz
RUN cp -R wordpress/* /var/www/html/
RUN rm -rf /var/www/html/index.html
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/
RUN a2enmod headers
RUN a2enmod rewrite
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2$SUFFIX
ENV APACHE_LOCK_DIR /var/lock/apache2$SUFFIX
ENV APACHE_LOG_DIR /var/log/apache2
RUN apt-get clean all 
CMD /usr/sbin/apache2 -DFOREGROUND
