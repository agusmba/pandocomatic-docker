# Pandoc & Pandocomatic Docker Image

[Docker](https://www.docker.io/) image for converting docuements
with [Pandoc](http://pandoc.org/) and [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/).

**NO LATEX** included in order to keep the image small.

Work in progress.

* Workdir is `/source`
* pandoc/pandocomatic data-dir is `/root/.pandoc`

Sample docker invokation for inspecting the image:

```sh
$ docker run --rm -it -v /local-source-dir:/source \
                      -v /home/username/.pandoc:/root/.pandoc \
                      agusmba/pandocomatic bash
```

Other similar projects:

* [pandoc-docker](https://github.com/jagregory/pandoc-docker)