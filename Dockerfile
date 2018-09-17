FROM ruby:2.1
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-ruby-dev)
LABEL description="Ruby development image 2.1"

ARG DOCKERIZE_VERSION=v0.6.0

RUN apt-get update && apt-get install -y --no-install-recommends \
		git \
		nodejs \
		npm \
		vim \
		wget \
    && rm -rf /var/lib/apt/lists/* \
		&& groupadd --gid 1000 sprout \
	  && useradd --uid 1000 --gid sprout --shell /bin/bash --create-home sprout \
	  && mkdir -p /work/app/src /usr/local/bundle \
	  && chown -R sprout:sprout /home/sprout /work /usr/local/bundle \
		&& wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
		&& tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
		&& rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV PORT 3500

USER sprout
