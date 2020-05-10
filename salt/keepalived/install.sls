install-keepalived:
  pkg.installed:
    - pkgs:
      - keepalived

  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/files/keepalived.conf
    - template: jinja
    - context:
      STATE: {{ pillar['state'] }} 
      VRID: {{ pillar['vrid'] }}
      PRIORITY: {{ pillar['priority'] }}

  service.running:
    - name: keepalived
    - watch:
      - file: install-keepalived
