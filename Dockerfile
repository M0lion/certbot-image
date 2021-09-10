FROM arm32v7/node

USER root

EXPOSE 80

# Install acme.sh
RUN apt-get update
RUN apt-get install cron -y
RUN apt-get install socat
RUN curl https://get.acme.sh | sh -s email=bjorn-moholt@hotmail.com

# Install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# secret.yaml template
COPY secret.yaml secret.yaml

# Copy entrypoint
COPY do-stuff.sh do-stuff.sh
RUN chmod +x do-stuff.sh

CMD ./do-stuff.sh
