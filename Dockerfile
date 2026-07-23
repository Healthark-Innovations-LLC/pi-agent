FROM node:latest

ENV OLLAMA_CONTEXT_LENGTH=256000

ENV TAU_MIRROR_PORT=3001
ENV TAU_HOST=0.0.0.0
#ENV TAU_STATIC_DIR
ENV TAU_DISABLED=0
#ENV TAU_USER=""
#ENV TAU_PASS=""

EXPOSE 3001

WORKDIR /

# install pi
RUN apt update && \
    apt install -y vim curl wget unzip && \
    apt clean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - --break-system-packages && \
    python3 -m pip install -U pip --break-system-packages

COPY install /install

RUN curl -fsSL https://pi.dev/install.sh | sh && \
    pi update && \
    pi update --extensions && \
    bash /install/pi-extensions.sh

COPY models.json /root/.pi/agent/models.json
#COPY auth.json /root/.pi/agent/models.json
COPY docker/bin /root/.pi/agent/bin

WORKDIR /root/brain/

VOLUME /root/.pi/agent/sessions

COPY entrypoint.sh /pi.sh
RUN chmod +x /pi.sh

ENTRYPOINT ["/pi.sh"]
