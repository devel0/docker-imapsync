# docker-imapsync

synchronize between imaps docker

> **Note** : this is a not yet generalized version and requires token replacement ( ie. example.com, my.local, ip addresses ) so inspect carefully all files before execution

## prerequisites

- [docker-ubuntu](https://github.com/devel0/docker-ubuntu)
- [linux-scripts-utils](https://github.com/devel0/linux-scripts-utils)
- docker network `imapsync`
- `/scripts/constants` with `ip_imapsync_srv` docker ip address
- `/security/mail_srv1` and `/security/mail_srv2` with user email password

## install

```
./build.sh
./run.sh
```

## example

- see [sync-example.sh]
