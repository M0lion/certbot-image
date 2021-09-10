FROM arm32v7/node

USER root

EXPOSE 80

RUN apt-get update
RUN apt-get install cron -y
RUN apt-get install socat
RUN curl https://get.acme.sh | sh -s email=bjorn-moholt@hotmail.com

RUN apt update && \
      apt install -y curl && \
      curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
      chmod +x ./kubectl && \
      mv ./kubectl /usr/local/bin/kubectl

COPY secret.yaml secret.yaml

COPY do-stuff.sh do-stuff.sh
RUN chmod +x do-stuff.sh

CMD ./do-stuff.sh
