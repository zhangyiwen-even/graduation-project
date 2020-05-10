{% if grains['fqdn'] == 'server5' %}
webserver: nginx
state: MASTER
vrid: 24
priority: 100
ip: 192.168.221.105
port: 80
{% elif grains['fqdn'] == 'server6' %}
webserver: nginx
state: BACKUP
vrid: 24
priority: 50
ip: 192.168.221.106
port: 80
{% endif %}
