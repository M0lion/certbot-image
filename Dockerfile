FROM arm32v7/node

USER root

# Update snap
RUN snap install core
RUN snap refresh core

# Install certbot
RUN snap install --classic certbot

EXPOSE 80

CMD certbot certonly --standalone