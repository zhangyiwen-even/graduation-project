install-httpd:
  pkg.installed:
    - pkgs:
      - httpd

  service.running:
    - name: httpd
    - enable: True

install-php-fpm:
  pkg.installed:
    - pkgs:
      - php-fpm
      - php

  service.running:
   - name: php-fpm
   - enable: True

  file.managed:
    - name: /var/www/html/index.php
    - source: salt://php/files/index.php
