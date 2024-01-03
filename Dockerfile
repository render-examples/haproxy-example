FROM haproxy:lts
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends dnsutils curl procps
USER haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg