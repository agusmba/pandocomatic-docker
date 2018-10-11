# AMB: Dockerfile to create an image with pandoc, pandocomatic,
#      and [tinytex.](https://yihui.name/tinytex/)
FROM rocker/r-base:latest
ENV PATH=$PATH:/opt/TinyTeX/bin/x86_64-linux/

RUN wget "https://travis-bin.yihui.name/texlive-local.deb" \
  && dpkg -i texlive-local.deb \
  && rm texlive-local.deb \
  ## Use tinytex for LaTeX installation
  && install2.r --error tinytex \
  && R -e "tinytex::install_tinytex(dir = '/opt/TinyTeX')" \
  && /opt/TinyTeX/bin/*/tlmgr path add \
  && tlmgr install metafont mfware inconsolata tex ae parskip listings \
     # My CV requirements
     ltablex needspace enumitem ms fancyhdr xcolor xifthen ifmtarg setspace unicode-math filehook sourcesanspro tcolorbox pgf environ trimspaces lm-math \
  && tlmgr path add \
  && Rscript -e "tinytex::r_texmf()" \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin

FROM agusmba/pandocomatic:latest
ENV PATH=$PATH:/opt/TinyTeX/bin/x86_64-linux/

LABEL maintainer="Agustín Martín Barbero (ambarbero@ree.es)" \
      version="${PANDOCOMATIC_VERSION}-pandoc-${PANDOC_VERSION}-tex"

# Install requirements, CV class needs xelatex which needs libfontconfig
 RUN apt-get update \
         && apt-get install -y --no-install-recommends \
                 libfontconfig \
         && rm -fr /var/lib/apt/lists/*
COPY --from=0 /opt/TinyTeX /opt/TinyTeX
