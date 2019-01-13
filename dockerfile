# Inherit from tensorflow which is the most complex dependency
FROM tensorflow/tensorflow:latest-py3

# Copy the source
COPY . /matcom-ml

# Start inside the project folder
WORKDIR /matcom-ml

# Set language environment to UTF-8 by default
ENV LANG C.UTF-8

# Add all necessary Python dependencies here
RUN apt update && apt install -y git graphviz
RUN pip3 install -r requirements.txt

# Download all required corpora
RUN /matcom-ml/download_corpora.sh

# Set up volumes
VOLUME /matcom-ml

# By default launch a terminal
CMD jupyter notebook --allow-root
