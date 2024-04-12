FROM debian:bullseye

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/

COPY tools/ftpscript.sh /home/

RUN chmod +x /home/ftpscript.sh

ENTRYPOINT [ "/home/ftpscript.sh" ]