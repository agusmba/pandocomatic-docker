# Pandoc & Pandocomatic Docker Image

[Docker](https://www.docker.io/) [image](https://hub.docker.com/r/agusmba/pandocomatic/) for converting documents
with [Pandoc](http://pandoc.org/) and [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/).

Now with **TinyTeX** included!

Work in progress.

* Workdir is `/source`
* pandoc/pandocomatic data-dir is `/root/.pandoc`

Sample docker invokation for inspecting the image:

```sh
$ docker run --rm -it -v /local-source-dir:/source \
                      -v /home/username/.pandoc:/root/.pandoc \
                      agusmba/pandocomatic bash
```

Sample pandocomatic invokation from windows (notice the extra `/` at the beginning of local paths):

```sh
$ docker run --rm -it -v /$(pwd):/source \
              -v /$(pwd)/res:/root/.pandoc \
              agusmba/pandocomatic pandocomatic -i src/test-pandoc -o build
```

Other similar projects:

* [pandoc-docker](https://github.com/jagregory/pandoc-docker)
* [pandocker](https://github.com/dalibo/pandocker)

## Variants

* **latest**: Latest version with Pandocomatic and Pandoc (no latex)
* **x.y.z-pandoc-a.b.c**: Pandocomatic version `x.y.z` and Pandoc version a.b.c
* **x.y.z-pandoc-a.b.c-tex**: Pandocomatic version `x.y.z` and Pandoc version a.b.c, with latest TinyTex