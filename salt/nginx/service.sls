include:
  - nginx.install

/usr/local/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf

service-nginx:
  file.managed:
    - name: /usr/lib/systemd/system/nginx.service
    - source: salt://nginx/files/nginx.service    

  service.running:
    - name: nginx
    - reload: True
    - watch:
       - file: /usr/local/nginx/conf/nginx.conf
