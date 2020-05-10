include:
  - repos.zabbix

install-zabbix-server:
  pkg.installed:
    - zabbix-server-mysql
    - zabbix-agent
  
  file.managed:
    - name: /etc/zabbix/zabbix_server.conf
    - source: salt://zabbix-server/files/zabbix_server.conf
    - template: jinja
    - context:
      dbpasswd: {{ pillar['DBPASSWD'] }} 

  service.running:
    - name: zabbix-server
    - watch:
      - file: install-zabbix-server

zabbix-agent:
  service.running
