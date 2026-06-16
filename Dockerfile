FROM node:latest

RUN apt update; apt install -y vim curl wget unzip build-essential python3-dev
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - --break-system-packages
RUN python3 -m pip install -U pip --break-system-packages
RUN curl -fsSL https://pi.dev/install.sh | sh
RUN pi update
#RUN pi install git:github.com/deflating/tau

COPY models.json /root/.pi/agent/models.json

VOLUME /root/.pi/agent/sessions

WORKDIR /root

EXPOSE 3001

ENV OLLAMA_CONTEXT_LENGTH=256000

ENV TAU_MIRROR_PORT=3001
ENV TAU_HOST=0.0.0.0
#ENV TAU_STATIC_DIR
ENV TAU_DISABLED=0
#ENV TAU_USER=""
#ENV TAU_PASS=""

ENTRYPOINT pi
