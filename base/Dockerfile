# AMB: Base Dockerfile to create an image with pandoc, pandocomatic,
#      and what's necessary for generating docx documents.

FROM ubuntu:zesty

# utf problem with official ruby docker images. See https://oncletom.io/2015/docker-encoding/
ENV LANG C.UTF-8

LABEL maintainer="Agustín Martín Barbero (ambarbero@ree.es)" \
      version="base-0.0.1"

# Install requirements
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                curl \
                ruby \
        && rm -fr /var/lib/apt/lists/*

# Default CMD
CMD [ "bash"]