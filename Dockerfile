FROM arm32v7/node

USER root

EXPOSE 80

RUN apt-get install cron
RUN curl https://get.acme.sh | sh -s email=bjorn-moholt@hotmail.com

CMD sleep 9999