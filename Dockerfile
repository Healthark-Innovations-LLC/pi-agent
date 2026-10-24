FROM node:latest


ENV PI_TELEMETRY=0
ENV PI_CHECK_UPDATES=0
ENV DO_NOT_TRACK=1

ENV OLLAMA_CONTEXT_LENGTH=256000

ENV PATH="/root/.pi/agent/bin:$PATH"


WORKDIR /

# install pi
COPY install /install
COPY models.json /root/.pi/agent/models.json
COPY settings.json /root/.pi/agent/settings.json
#COPY auth.json /root/.pi/agent/models.json
COPY docker/bin /root/.pi/agent/bin

COPY entrypoint.sh /pi.sh

RUN apt update && \
    apt install -y vim curl wget unzip cron && \
	#
	curl -fsSL https://pi.dev/install.sh | sh && \
	#
	pi update && \
    pi update --extensions && \
    bash /install/pi-extensions.sh && \
	#
	git clone https://github.com/TheShellLand/SKILLS.md && \
	#
	chmod +x /pi.sh


WORKDIR /root/brain/

VOLUME /root/.pi/agent/sessions

EXPOSE 3001

ENTRYPOINT ["/pi.sh"]

