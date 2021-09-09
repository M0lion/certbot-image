FROM arm32v7/node

USER root

EXPOSE 80

RUN apt-get update
RUN apt-get install cron -y
RUN curl https://get.acme.sh | sh -s email=bjorn-moholt@hotmail.com

CMD /root/.acme.sh/acme.sh --issue --standalone -d molion.dev