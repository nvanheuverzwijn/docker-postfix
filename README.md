# Postfix

This repository is a docker image for [postfix](http://www.postfix.org/).

## Build and Run

Start the server:
```
docker build . -t postfix
docker run --rm --name pf postfix
```

Start a shell inside the container:
```
docker exec -it pf bash
```

## Environment Variable
### POSTFIX_CONFIG_MAIN_CF
If set, the content of this variable will overwrite everything in `/etc/postfix/main.cf`.

### POSTFIX_CONFIG_MASTER_CF
If set, the content of this variable will overwrite everything in `/etc/postfix/master.cf`.
