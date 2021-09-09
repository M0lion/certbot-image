FROM arm32v7/node

USER root

RUN apt-get update
RUN apt-get install -y certbot

EXPOSE 80

CMD certbot certonly --standalone