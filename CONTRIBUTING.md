# Contributing

## Build and deploy

```bash
rockcraft pack -v
sudo skopeo --insecure-policy copy oci-archive:nginx_1.23.3_amd64.rock docker-daemon:nginx:1.23.3
docker run nginx:1.23.3
```
