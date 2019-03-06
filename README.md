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
* **latest-tex**: Latest version with Pandocomatic and Pandoc, with latest TinyTex
* **x.y.z-pandoc-a.b.c**: Pandocomatic version `x.y.z` and Pandoc version `a.b.c`
* **x.y.z-pandoc-a.b.c-tex**: Pandocomatic version `x.y.z` and Pandoc version `a.b.c`, with latest TinyTex

## Troubleshooting

### Building local images

If you want to build the images locally instead of using the public [images](https://hub.docker.com/r/agusmba/pandocomatic/), review the Dockerfile dependencies between:

* `tex/Dockerfile`
* `./Dockerfile`
* `base/Dockerfile`

And build them in order with the right tagging:

```bash
docker build -t agusmba/pandocomatic:base-${base-version} base/
docker build -t agusmba/pandocomatic:latest ./
docker build -t agusmba/pandocomatic:latest-tex tex/
```

### Adding (La)Tex packages to the `tex` image

You can add additional extra packages to the `tex/Dockerfile`. However since the docker build step takes time, you should be sure about all the required packages in order to avoid additional build cycles.

In order to find all extra latex packages to install, you may fire up the latest image (with tex support), install `perl` and use `tlmgr` to manually install all missing packages. Once you have the list of extra needed packages, modify the Dockerfile accordingly:

```sh
$ docker run --rm -it -v /local-source-dir:/source \
                      -v /home/username/.pandoc:/root/.pandoc \
                      agusmba/pandocomatic:latest-tex bash
$ apt-get update
$ apt-get install perl
# repeat until no missing packages:
$ pandocomatic -i xxx -o yyy ...
$ tlmgr install ${my-missing-packages-list}
```