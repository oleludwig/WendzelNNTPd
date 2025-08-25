This chapter provides a guide on how to install WendzelNNTPd 2.x.

# Linux/*nix/BSD
To install WendzelNNTPd from source you need to download the provided archive file
(e.g., `wendzelnntpd-2.0.0.tar.gz`) file.[^1] Extract it and run **./configure**. Please note that
configure indicates missing libraries and packages that you may first need to install using
the package system of your operating system.

```
$ tar -xzf wendzelnntpd-2.0.0.tgz
$ cd wendzelnntpd
$ ./configure
...
```
Please refer to Section [Test](index.md#history)


```ini
<connector>
	;; enables STARTTLS for this port
	;enable-starttls
	port		119
	listen	    127.0.0.1
	;; configure SSL server certificate (required)
	;tls-server-certificate "/usr/local/etc/ssl/server.crt"
	;; configure SSL private key (required)
	;tls-server-key "/usr/local/etc/ssl/server.key"
	;; configure SSL CA certificate (required)
	;tls-ca-certificate "/usr/local/etc/ssl/ca.crt"
	;; configure TLS ciphers for TLSv1.3
	;tls-cipher-suites "TLS_AES_128_GCM_SHA256"
	;; configure TLS ciphers for TLSv1.1 and TLSv1.2
	;tls-ciphers "ALL:!COMPLEMENTOFDEFAULT:!eNULL"
	;; configure allowed TLS version (1.0-1.3)
	;tls-version "1.2-1.3"
	;; possibility to force the client to authenticate 
	;;with client certificate (none | optional | require)
	;tls-verify-client "required"
	;; define depth for checking client certificate
	;tls-verify-client-depth 0
	;; possibility to use certificate revocation list (none | leaf | chain)
	;tls-crl "none"
	;tls-crl-file "/usr/local/etc/ssl/ssl.crl"
</connector>
```


[^1]: On some *nix-like operating systems you need to first run **gzip -d wendzelnntpd-VERSION.tgz** and then
      **tar -xf wendzelnntpd-VERSION.tar** instead of letting **tar** do the whole job.
