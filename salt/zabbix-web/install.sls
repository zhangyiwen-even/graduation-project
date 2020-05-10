include:
  - repos.zabbix

install-zabbix-web:
  pkg.installed:
    - pkgs:
      - zabbix-web-mysql
      - zabbix-web
      - httpd
      - php
      - php-mysql

  file.managed:
    - name: /etc/httpd/conf.d/zabbix.conf
    - source: salt://zabbix-web/files/zabbix.conf

  service.running:
    - name: httpd
    - watch:
      - file: install-zabbix-web 
