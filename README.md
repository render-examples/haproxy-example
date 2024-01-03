# haproxy
Manually create `haproxy.cfg` from the template
```bash
cat haproxy.cfg.template | \
  BACKEND_SLUG=<the slug of the backend service. It is not the service ID> \
  BACKEND_PORT=<the port of the backend service> \
  BACKEND_HEALTHCHECK_URI=<the health check URI of the backend service> \
  BACKEND_MIN_INSTANCES=<the minimal instances of the backend service> \
  BACKEND_MAX_INSTANCES=<the maximal instances of the backend service> \
  LOCAL_DOMAIN=<the local domain, which can be found in the /etc/resolv.conf> envsubst > haproxy.cfg
```
Example:
```bash
cat haproxy.cfg.template | \
  BACKEND_SLUG=backend-kuip \
  BACKEND_PORT=10000 \
  BACKEND_HEALTHCHECK_URI=/check \
  BACKEND_MIN_INSTANCES=1 \
  BACKEND_MAX_INSTANCES=5 \
  LOCAL_DOMAIN=usr-bupfjt793em8dprtcjn0.svc.cluster.local envsubst > haproxy.cfg.example
```