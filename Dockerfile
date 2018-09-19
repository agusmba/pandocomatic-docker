# AMB: Dockerfile to create an image with pandoc, pandocomatic,
#      and what's necessary for generating docx documents.

FROM agusmba/pandoc-test:base-0.0.1

# utf problem with official ruby docker images. See https://oncletom.io/2015/docker-encoding/
# ENV LANG C.UTF-8

ENV PANDOC_VERSION="2.3" \
    DEB_PKG_REVISION="1" \
    PANDOCOMATIC_VERSION="0.2.3.0"

LABEL maintainer="Agustín Martín Barbero (ambarbero@ree.es)" \
      version="${PANDOCOMATIC_VERSION}-pandoc-${PANDOC_VERSION}"

# Install requirements
# RUN apt-get update \
#         && apt-get install -y --no-install-recommends \
#                 curl \
#                 ruby \
#         && rm -fr /var/lib/apt/lists/*

# Install pandoc
RUN curl -fLsS -o pandoc.deb https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-${DEB_PKG_REVISION}-amd64.deb \
        && apt-get install ./pandoc.deb \
        && rm ./pandoc.deb

# Install pandocomatic
RUN gem install pandocomatic -v "=${PANDOCOMATIC_VERSION}"

# Default dir
WORKDIR /source

# Copy templates?

# Default CMD
CMD [ "pandocomatic", "-v"]
