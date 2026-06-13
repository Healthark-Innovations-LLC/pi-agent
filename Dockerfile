FROM node:latest

RUN apt update; apt install -y vim curl wget unzip build-essential python3-dev
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - --break-system-packages
RUN python3 -m pip install -U pip --break-system-packages
RUN curl -fsSL https://pi.dev/install.sh | sh

COPY models.json /root/.pi/agent/models.json

VOLUME /root/.pi

WORKDIR /root

ENTRYPOINT pi

