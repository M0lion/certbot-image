FROM arm32v7/node

USER root

#install snap
RUN apt update
RUN apt install -y snapd

RUN systemctl unmask snapd.service
RUN systemctl enable snapd.service
RUN systemctl sart snapd.service

# Update snap
RUN snap install core
RUN snap refresh core

# Install certbot
RUN snap install --classic certbot

EXPOSE 80

CMD certbot certonly --standalone