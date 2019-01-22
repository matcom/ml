FROM matcomuh/ml:gpu

RUN apt install sudo

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt install -y nodejs
RUN npm install -g configurable-http-proxy

RUN pip install jupyterhub
RUN mkdir -p /etc/jupyterhub/

RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1000 admin
RUN echo admin:admin | chpasswd
