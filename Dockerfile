FROM arm32v7/node

USER root

EXPOSE 80

RUN apt-get update
RUN apt-get install cron -y
RUN apt-get install socat
RUN curl https://get.acme.sh | sh -s email=bjorn-moholt@hotmail.com

COPY secret.yaml secret.yaml

COPY do-stuff.sh do-stuff.sh
RUN chmod +x do-stuff.sh

CMD sudo ./do-stuff.sh
