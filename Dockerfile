
# Dockerfile
FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y asterisk curl python3 python3-pip nginx supervisor && \
    apt-get clean

COPY asterisk/ /etc/asterisk/
COPY app/ /app/
COPY supervisord.conf /etc/supervisord.conf

WORKDIR /app
RUN pip3 install flask

EXPOSE 5060/udp 8088 8089 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
