# MatCom Machine Learning image

Base machine learning images and environment with CPU and GPU support.

This repository contains two images:
* `matcomuh/ml:cpu` is a basic machine learning image with several popular ML tools.
* `matcomuh/hub:cpu` is a fully-functional JupyterHub on top of the basic ML image.

Also, the same images with GPU support:
* `matcomuh/ml:gpu`
* `matcomuh/hub:gpu`

## Basic ML usage

If you just want to hack machine learning on your own, you can use the basic image.
Clone this repository and run:

```bash
docker-compose up ml
```

In [localhost:8888](http://localhost:8888) you will find an instance of [JupyterLab](https://github.com/jupyterlab/jupyterlab).
The notebooks are stored in the local `notebooks` folder.

## JupyterHub

If you need a more advanced multi-user JupyterHub scenario, then run:

```bash
docker-compose up hub
```

In [localhost:8000](http://localhost:8000) you will find an instance of [JupyterHub](https://github.com/jupyterhub/jupyterhub).
* The default user is `admin` with password `admin`.
* The file `hub/config.py` contains the configuration file for this instance.

Users are by default added to the system, and their data folders are mounted in a `docker` volume.
Hence when the container is re-created the data and users will still be there.

> **NOTE**: New users are created by default with the same username as password. When the container is destroyed and re-created, **password changes are not saved** for now.

## Running the GPU version

By default the CPU version of the services are run. If you want to try the GPU version, you will need [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) installed, and suitable NVIDIA drivers for your box.

With all prerequisites, you are ready to run the GPU version of the services:

```bash
docker-compose -f docker-compose.yml -f docker-compose.gpu.yml up [ml|hub]
```

If you are gonna be running GPU all the time, consider creating a `docker-compose.override.yml` link to simplify things:

```bash
ln -s docker-compose.gpu.yml docker-compose.override.yml
```

Then just running `docker-compose up` as usual will automatically use the GPU version of the services.

## What's included

* Jupyter Notebook / Lab / Hub
* Tensorflow (1.12.0)
* Keras (2.1.6-tf) _(see note)_
* Scikit-learn (0.20)
  * hmmlearn
  * sklearn-crfsuite
  * seqlearn
* Flask & Flask-RESTful
* Gensim
* Graphviz
* NLTK
* owlready (1 & 2)
* Spacy
  * (`en` and `es` corpora)
  * `neuralcoref`

Plus small utilities such as `psutils`. Take a look at the [requirements.txt](requirements.txt) file.

> **NOTE:** To use `keras`, you have to import it as `from tensorflow import keras`.

## Contributors:

* [Alejandro Piad](https://github.com/apiad)
* [Hian Cañizares](https://github.com/hiancdtrsnm)

## License & Contributions

All contributions are appreciated! Licensed under MIT.
Make sure to add your name to the previous list.

> MIT License
>
> Copyright (c) 2018 Faculty of Math and Computer Science, University of Havana
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.
