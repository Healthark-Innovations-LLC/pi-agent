FROM node:latest

# docker-out-of-docker
RUN apt update && \
    apt install -y ca-certificates docker.io && \
    apt clean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# ansible
RUN git clone https://github.com/TheShellLand/antsable && \
    bash antsable/install-ansible.sh

# install pi
RUN apt update && \
    apt install -y vim curl wget unzip build-essential python3-dev && \
    apt clean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - --break-system-packages && \
    python3 -m pip install -U pip --break-system-packages
RUN curl -fsSL https://pi.dev/install.sh | sh && \
    pi update && \
    pi install git:github.com/deflating/tau

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

COPY entry.sh /entry.sh

ENTRYPOINT ["/bin/bash", "/entry.sh"]
