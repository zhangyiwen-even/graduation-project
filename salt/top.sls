base:
  'server1':
    - zabbix-agent.install
    - zabbix-server.install
    - zabbix-web.install
    - mariadb-server.install

  'server2':
    - nginx.service
    - zabbix-agent.install
  
  'server3':
    - nginx.service
    - zabbix-agent.install

  'server4':
    - nginx.service
    - zabbix-agent.install

  'server5':
    - mysql.install
    - zabbix-agent.install
    - keepalived.install
    - haproxy.install

  'server6':
    - mysql.install
    - zabbix-agent.install
    - keepalived.install
    - haproxy.install
 
  'server7':
    - php.install
    - zabbix-agent.install
