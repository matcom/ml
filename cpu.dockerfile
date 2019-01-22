# Inherit from tensorflow which is the most complex dependency
FROM tensorflow/tensorflow:1.12.0-py3

# Copy the source
COPY . /ml

# Start inside the project folder
WORKDIR /ml

# Set language environment to UTF-8 by default
ENV LANG C.UTF-8

# Add all necessary system dependencies here
RUN apt update && apt install -y graphviz && rm -rf /var/apt/cache

# Python dependencies (managed through pip)
RUN pip install jupyterlab
RUN pip install cython
RUN pip install -r requirements.txt

# Download all required corpora
RUN /ml/download_corpora.sh

# By default launch a terminal
CMD bash
