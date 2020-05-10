include:
  - pkgs.install

install-nginx:
  file.managed:
    - name: /mnt/nginx-1.12.2.tar.gz 
    - source: salt://nginx/files/nginx-1.12.2.tar.gz

  cmd.run:
    - name: cd /mnt && tar zxf nginx-1.12.2.tar.gz && cd nginx-1.12.2 && sed -i 's/CFLAGS="$CFLAGS -g"/#CFLAGS="$CFLAGS -g"/g' auto/cc/gcc && ./configure --prefix=/usr/local/nginx && make && make install  
 
    - creates: /usr/local/nginx

configure-nginx:
  file.managed:
    - name: /usr/local/nginx/html/index.html 
    - source: salt://nginx/files/index.html
    - template: jinja
    - context:
      hostname: {{ grains['fqdn'] }}
