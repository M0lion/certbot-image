FROM ubuntu

# Update snap
RUN sudo snap install core
RUN sudo snap refresh core

# Install certbot
RUN sudo snap install --classic certbot

EXPOSE 80

CMD sudo certbot certonly --standalone