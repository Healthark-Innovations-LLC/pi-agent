FROM node:latest

# ansible
RUN git clone https://github.com/TheShellLand/antsable && \
    cd antsable && \
    bash install-ansible.sh && \
    # chrome, docker
    bash ansible-local.sh playbooks/readyup.yml

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
    pi update --extensions && \
    pi install git:github.com/deflating/tau

COPY models.json /root/.pi/agent/models.json
#COPY SYSTEM.md /root/.pi/agent/APPEND_SYSTEM.md
COPY SYSTEM.md /root/.pi/agent/SYSTEM.md

VOLUME /root/.pi/agent/sessions

WORKDIR /root/brain

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
