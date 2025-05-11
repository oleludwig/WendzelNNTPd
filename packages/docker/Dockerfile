FROM debian:stable-slim as build-env

RUN apt-get update && apt-get install -y --no-install-recommends \
    bison \
    #ca-certificates \
    flex \
    gcc \
    libmariadb-dev-compat \
    libmariadb-dev \
    libmhash-dev \
    libsqlite3-dev \
    libssl-dev \
    #mariadb-client \
    make \
    openssl \
    sqlite3 # lässt sich vllt. entfernen, wenn man configure anpasst; zum bauen müsste libsqlite3-dev reichen
# openssl lässt sich vllt. entfernen, wenn man configure anpasst; zum bauen müsste libssl-dev reichen
# TODO: mariadb-client prüfen, obs ganz weg kann, dann auch an anderen Stellen entfernen

COPY . /wendzelnntpd
WORKDIR /wendzelnntpd

RUN ./configure
RUN make
RUN make install


FROM debian:stable-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libmariadb3 \
    libmhash2 \
    libsqlite3-0 \
    libssl3
# sqlite3? lib dürfte reichen, das ist nur noch zusätzlich cli

#Stattdessen die gebauten Dateien von vorm make install kopieren?
COPY --from=build-env /usr/local/sbin/wendzelnntpd /usr/local/sbin/wendzelnntpd
COPY --from=build-env /usr/local/sbin/wendzelnntpadm /usr/local/sbin/wendzelnntpadm
#TODO: doc, man
# image konfigurierbar machen
COPY --from=build-env /usr/local/etc/wendzelnntpd.conf /usr/local/etc/wendzelnntpd.conf


# /var/spool/news/wendzelnntpd muss persistierbar sein; volume?
#Datenbank muss persistiert werden
#nicht rüberkopieren, sondern bei fehlender Datenbank analog zu make install aus Vorlage erzeugen?
COPY --from=build-env /var/spool/news/wendzelnntpd/usenet.db /var/spool/news/wendzelnntpd/usenet.db

EXPOSE 119
EXPOSE 563

ENTRYPOINT [ "/usr/local/sbin/wendzelnntpd" ]
