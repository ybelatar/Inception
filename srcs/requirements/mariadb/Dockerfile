FROM debian:bullseye

RUN apt-get update && \
    apt install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/dbscript.sh /

RUN chmod +x /dbscript.sh

ENTRYPOINT [ "/dbscript.sh" ]