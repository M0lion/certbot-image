FROM arm32v7/node

USER root

RUN apt install certbot

EXPOSE 80

CMD certbot certonly --standalone