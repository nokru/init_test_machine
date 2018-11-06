$(eval $(call defw,MAKE,make))


.PHONY: install-apache
install-apache:: ##@Build Install apache
	apt-get install -y apache2

.PHONY: install-mysql
install-mysql:: ##@Build Install MySQL/MariaDB
	apt-get install -y mariadb-client mariadb-server

.PHONY: install-php
install-php:: ##@Build Install PHP7
	apt-get install -y php7.0 php7.0-mysql

.PHONY: install-phpmyadmin
install-phpmyadmin:: ##@Build Install phpmyadmin
	apt-get install -y phpmyadmin

.PHONY: install-lamp
lamp:: ##@Build Install all LAMP Components
lamp:: install-apache install-mysql install-php install-phpmyadmin

