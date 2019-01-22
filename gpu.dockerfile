# Inherit from tensorflow which is the most complex dependency
FROM tensorflow/tensorflow:1.12.0-gpu-py3

# Copy the source
COPY . /ml

# Start inside the project folder
WORKDIR /ml

# Set language environment to UTF-8 by default
ENV LANG C.UTF-8

# Install dependencies
RUN apt update && apt install -y git curl graphviz && rm -rf /var/apt/cache

# Install Jupyter Notebook Lab
RUN pip install jupyterlab

# Python dependencies (managed through pip)
RUN pip install cython
RUN pip install -r requirements.txt

# Download all required corpora
RUN /ml/download_corpora.sh

# By default launch a terminal
CMD bash
