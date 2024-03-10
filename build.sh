#!/bin/sh

apt update
apt install -y libssl-dev \
libpcre2-dev \
libgd-dev \
libgeoip-dev

# module patch
patch -p1 < ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_102101.patch

# build
./configure \
--add-module=ngx_http_proxy_connect_module-0.0.5 \
--with-debug \
--prefix=/usr/local/share/nginx \
--sbin-path=/usr/local/bin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--http-log-path=/dev/null \
--error-log-path=/dev/null \
--pid-path=/var/tmp/nginx.pid \
--lock-path=/var/tmp/nginx.lock \
--with-threads \
--with-http_ssl_module \
--with-http_v2_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_image_filter_module=dynamic \
--with-http_geoip_module=dynamic \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_auth_request_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module

# make && install
make
make install
