FROM fedora:24

EXPOSE 80

RUN dnf install certbot -y && dnf clean all
RUN mkdir /etc/letsencrypt

CMD certbot certonly --standalone