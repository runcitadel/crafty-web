FROM openjdk:19-bullseye

ENV DEBIAN_FRONTEND="noninteractive"

# Security Patch for CVE-2021-44228
ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true

LABEL maintainer="Phillip Tarrant <https://gitlab.com/Ptarrant1> and Dockerfile created by kevdagoat <https://gitlab.com/kevdagoat>"

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip libmariadb-dev wget

COPY requirements.txt /crafty_web/requirements.txt
RUN pip3 install -r /crafty_web/requirements.txt

COPY ./ /crafty_web
WORKDIR /crafty_web

EXPOSE 8000
EXPOSE 25500-25600

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir -p /servers

RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
