FROM python:3.7-slim

LABEL "com.github.actions.name"="Pelican for GitHub Pages"
LABEL "com.github.actions.description"="Builds and deploys the Pelican project to GitHub Pages"
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="red"

LABEL "Name"="Pelican for GitHub Pages"
LABEL "Version"="0.1.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update \
    && apt-get install --no-install-recommends -qy git curl bash


RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs npm

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
