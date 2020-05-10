install-mariadb-server:
  pkg.installed:
    - pkgs: 
      - mariadb
      - mariadb-server
      - MySQL-python

service-mariadb-server:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mysql/files/my.cnf

  service.running:
    - name: mariadb.service
    - reload: True
    - watch:
       - file: /etc/my.cnf
