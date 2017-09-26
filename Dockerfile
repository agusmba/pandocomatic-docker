# AMB: Dockerfile to create an image with pandoc, pandocomatic,
#      and what's necessary for generating docx documents.
# 2017/09/21: 0.1 Initial version

FROM ubuntu:zesty

MAINTAINER Agustín Martín Barbero (ambarbero@ree.es)

# utf problem with official ruby docker images. See https://oncletom.io/2015/docker-encoding/
ENV LANG C.UTF-8

ENV PANDOC_VERSION "1.19.2.1"

# Install requirements
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                curl \
                ruby \
        && rm -fr /var/lib/apt/lists/*

# Install pandoc
RUN curl -fLsS -o pandoc.deb https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb \
        && apt-get install ./pandoc.deb \
        && rm ./pandoc.deb

# Not used except for triggering a build
ENV PANDOCOMATIC_VERSION "0.2.0.4"

# Install pandocomatic
RUN gem install pandocomatic

# Default dir
WORKDIR /source

# Copy templates?

# Default CMD
CMD [ "pandocomatic" ]
