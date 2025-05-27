FROM debian

RUN apt-get update && apt-get install -y ca-certificates debian-archive-keyring curl gnupg apt-transport-https

RUN curl -fsSL https://packagecloud.io/varnishcache/varnish60lts/gpgkey | gpg --dearmor > /etc/apt/keyrings/varnishcache_varnish60lts-archive-keyring.gpg

RUN . /etc/os-release && echo "deb [signed-by=/etc/apt/keyrings/varnishcache_varnish60lts-archive-keyring.gpg] https://packagecloud.io/varnishcache/varnish60lts/$ID/ $VERSION_CODENAME main" > /etc/apt/sources.list.d/varnishcache_varnish60lts.list && \
    echo "Package: varnish varnish-*\nPin: release o=packagecloud.io/varnishcache/*\nPin-Priority: 1000\n" > /etc/apt/preferences.d/varnishcache
RUN apt-get update && \
    apt-get install -y varnish stunnel4 && \
    rm -rf /var/lib/apt/lists/*

COPY stunnel.conf /etc/stunnel/stunnel.conf

COPY default.vcl /etc/varnish/default.vcl

EXPOSE 6081 8443

CMD stunnel /etc/stunnel/stunnel.conf & \
    varnishd -F -a :6081 -f /etc/varnish/default.vcl