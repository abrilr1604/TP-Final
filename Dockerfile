FROM ubuntu
MAINTAINER Abril Rodriguez

COPY ./ /TrabajoFinal

WORKDIR /TrabajoFinal

RUN chmod +777 *.sh *.txt

ENTRYPOINT ./menu.sh textoprueba.txt



