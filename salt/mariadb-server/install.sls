install-db:
  pkg.installed:
    - pkgs: 
      - mariadb
      - mariadb-server
      - MySQL-python

  service.running:
    - name: mariadb-server

  cmd.run:
    - name: mysql -e "DELETE FROM mysql.user WHERE User='';" && "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" && "DROP DATABASE IF EXISTS test;" && "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" && "FLUSH PRIVILEGES;"      
    - onlyif : mysql -e "show databases;"  

  mysql_user.present:
    - name: root
    - password: redhat

configure-db:        
  file.managed:
    - name: /mnt/create.sql.gz
    - source: salt://mariadb-server/files/create.sql.gz

  mysql_database.present:       
    - name: zabbix
    - character_set: utf8
    - collate: utf8_bin
    - connection_user: root
    - connection_pass: redhat

  mysql_user.present:
    - name: zabbix
    - host: localhost
    - password: westos
    - connection_user: root
    - connection_pass: redhat

  mysql_grants.present:                                                                                                                                                                                                                          
    - grant: all privileges
    - database: zabbix.*
    - user: zabbix
    - connection_user: root
    - connection_pass: redhat

  cmd.wait:
    - name: zcat /mnt/create.sql.gz | mysql -predhat zabbix
    - watch:
      - mysql_database: configure-db
