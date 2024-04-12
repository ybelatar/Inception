FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y  && \
    apt-get install -y iproute2 vim curl jq ca-certificates apt-transport-https gnupg wget && \
    rm -rf /var/lib/apt/lists/*


RUN wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list

RUN apt-get update && \
    apt-get install -y java-21-amazon-corretto-jdk



RUN useradd -m ybelatar

RUN mkdir /home/ybelatar/minecraft

WORKDIR /home/ybelatar/minecraft

COPY conf/eula.txt /home/ybelatar/minecraft/
COPY conf/server.properties /home/ybelatar/minecraft/
COPY tools/mcscript.sh /home/ybelatar/minecraft/

RUN chown -R ybelatar /home/ybelatar
USER ybelatar
RUN chmod +x /home/ybelatar/minecraft/mcscript.sh

CMD [ "/home/ybelatar/minecraft/mcscript.sh" ]