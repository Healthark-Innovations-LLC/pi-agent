#FROM node:latest
FROM ghcr.io/open-webui/pipelines

RUN apt update; apt install -y curl vim nodejs npm
RUN curl -fsSL https://pi.dev/install.sh | sh

WORKDIR /root
COPY models.json /root/.pi/agent/models.json

VOLUME /root/.pi

ENTRYPOINT pi

