FROM haproxy:lts
USER root
RUN apt-get update && apt-get install -y gettext
ARG BACKEND_HEALTHCHECK_URI
ARG BACKEND_MIN_INSTANCES
ARG BACKEND_MAX_INSTANCES
ARG BACKEND_SLUG
ARG BACKEND_PORT
COPY haproxy.cfg.template /usr/local/etc/haproxy/haproxy.cfg.template
RUN export LOCAL_DOMAIN=$(grep ^search /etc/resolv.conf | awk '{print $2}') && \
    cat /usr/local/etc/haproxy/haproxy.cfg.template | envsubst > /usr/local/etc/haproxy/haproxy.cfg
USER haproxy

