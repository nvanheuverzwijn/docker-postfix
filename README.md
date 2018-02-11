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

## Example
### Docker Compose

```
version: '3'
services:
  postfix:
    build: .
    ports:
      - 25:25
      - 465:465
      - 587:587
    environment:
      POSTFIX_CONFIG_MAIN_CF: |
        smtpd_banner = $$myhostname ESMTP $$mail_name (Debian/GNU)
        biff = no
        append_dot_mydomain = no
        readme_directory = no
        compatibility_level = 2
        smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
        smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
        smtpd_use_tls=yes
        smtpd_tls_session_cache_database = btree:$${data_directory}/smtpd_scache
        smtp_tls_session_cache_database = btree:$${data_directory}/smtp_scache
        smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
        myhostname = postfix
        alias_maps = hash:/etc/aliases
        alias_database = hash:/etc/aliases
        mydestination = $$myhostname, /etc/mailname, 9bd7189230cb, localhost.localdomain, localhost
        relayhost =
        mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
        mailbox_size_limit = 0
        recipient_delimiter = +
        inet_interfaces = all
        inet_protocols = all

      POSTFIX_CONFIG_MASTER_CF: |
        smtp      inet  n       -       y       -       -       smtpd
        pickup    unix  n       -       y       60      1       pickup
        cleanup   unix  n       -       y       -       0       cleanup
        qmgr      unix  n       -       n       300     1       qmgr
        tlsmgr    unix  -       -       y       1000?   1       tlsmgr
        rewrite   unix  -       -       y       -       -       trivial-rewrite
        bounce    unix  -       -       y       -       0       bounce
        defer     unix  -       -       y       -       0       bounce
        trace     unix  -       -       y       -       0       bounce
        verify    unix  -       -       y       -       1       verify
        flush     unix  n       -       y       1000?   0       flush
        proxymap  unix  -       -       n       -       -       proxymap
        proxywrite unix -       -       n       -       1       proxymap
        smtp      unix  -       -       y       -       -       smtp
        relay     unix  -       -       y       -       -       smtp
        showq     unix  n       -       y       -       -       showq
        error     unix  -       -       y       -       -       error
        retry     unix  -       -       y       -       -       error
        discard   unix  -       -       y       -       -       discard
        local     unix  -       n       n       -       -       local
        virtual   unix  -       n       n       -       -       virtual
        lmtp      unix  -       -       y       -       -       lmtp
        anvil     unix  -       -       y       -       1       anvil
        scache    unix  -       -       y       -       1       scache
        maildrop  unix  -       n       n       -       -       pipe
          flags=DRhu user=vmail argv=/usr/bin/maildrop -d $${recipient}
        uucp      unix  -       n       n       -       -       pipe
          flags=Fqhu user=uucp argv=uux -r -n -z -a$$sender - $$nexthop!rmail ($$recipient)
        ifmail    unix  -       n       n       -       -       pipe
          flags=F user=ftn argv=/usr/lib/ifmail/ifmail -r $$nexthop ($$recipient)
        bsmtp     unix  -       n       n       -       -       pipe
          flags=Fq. user=bsmtp argv=/usr/lib/bsmtp/bsmtp -t$$nexthop -f$$sender $$recipient
        scalemail-backend unix	-	n	n	-	2	pipe
          flags=R user=scalemail argv=/usr/lib/scalemail/bin/scalemail-store $${nexthop} $${user} $${extension}
        mailman   unix  -       n       n       -       -       pipe
          flags=FR user=list argv=/usr/lib/mailman/bin/postfix-to-mailman.py
          $${nexthop} $${user}
```
