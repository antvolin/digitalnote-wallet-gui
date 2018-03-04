FROM debian:latest

MAINTAINER antvolin@gmail.com

ARG USER_NAME

WORKDIR /digitalnote-work

ADD https://github.com/xdn-project/digitalnotewallet/releases/download/v1.0.13-beta/digitalnotewallet-1.0.13-beta-136.amd64.deb .

RUN apt-get update && apt-get install -y \
	libqt5core5a \
	libqt5gui5 \
	libqt5network5 \
	libqt5widgets5 && \
	dpkg -i digitalnotewallet-1.0.13-beta-136.amd64.deb

RUN adduser --disabled-password --gecos '' $USER_NAME
USER $USER_NAME
WORKDIR $HOME/.digitalnote/

CMD ["digitalnotewallet"]