FROM debian:bullseye

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y redis

COPY conf/redis.conf /etc/redis/

CMD [ "redis-server", "--protected-mode", "no" ]