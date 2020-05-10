install-haproxy:
  pkg.installed:
    - pkgs:
      - haproxy

  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/files/haproxy.cfg

  service.running:
    - name: haproxy
    - watch:
      - file: install-haproxy
