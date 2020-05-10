{% if grains['fqdn'] == 'server1' %}
DBPASSWD: redhat
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server2' %}
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server3' %}
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server4' %}
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server5' %}
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server6' %}
ZABBIX-SERVER: 192.168.221.101

{% elif grains['fqdn'] == 'server7' %}
ZABBIX-SERVER: 192.168.221.101
{% endif %}
