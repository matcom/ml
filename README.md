# MatCom Machine Learning image

Base machine learning images and environment.

This repository contains two images:
* `matcomuh/ml` is a basic machine learning image with several popular ML tools.
* `matcomuh/hub` is a fully-functional JupyterHub on top of the basic ML image.

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

Users are by default added to the system, and their data folders are **not** mounted outside the container.
Hence, you should (read **must**) modify the `docker-compose.yml` file and setup your own long-term persistence mechanism if you want multiple users to persist.

> **NOTE:** Keep in mind that if you destroy the container you will loose all your users and data, unless you have taken care of the previous point!

## What's included

* Jupyter Notebook / Lab / Hub
* Tensorflow (1.12.0)
* Keras (2.1.6-tf)
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

## License & Contributions

All contributions are appreciated! Licensed under MIT.

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
