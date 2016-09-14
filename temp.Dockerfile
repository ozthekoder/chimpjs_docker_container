# Dockerfile

# Using debian:jessie for it's smaller size over ubuntu
FROM debian:jessie

ENV REFRESHED_AT 2016-08-23

USER root

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Run updates and install deps
RUN apt-get clean
RUN apt-get upgrade
RUN apt-get update

RUN apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    g++ \
    gcc \
    git \
    make \
    nginx \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoclean

ENV WORKER_HOME /home/worker
ENV HOME ~
# Setup User
RUN useradd --home $WORKER_HOME -M worker -K UID_MIN=10000 -K GID_MIN=10000 -s /bin/bash
RUN mkdir $WORKER_HOME
RUN chown worker:worker $WORKER_HOME
RUN adduser worker sudo
RUN echo 'worker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER worker 

ENV NVM_VERSION 0.31.7
ENV NVM_DIR $HOME/.nvm/v$NVM_VERSION
ENV NODE_VERSION 4.1.2

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install 4.4.3 \
    && nvm use 4.4.3 \
    && npm install chimp -g \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Set up our PATH correctly so we don't have to long-reference npm, node, &c.
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN sudo apt-get update
RUN sudo apt-get install -y apt-utils xvfb unzip rlwrap software-properties-common

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN sudo apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN sudo apt-get install -y oracle-java8-installer
RUN sudo apt-get install -y oracle-java8-set-default

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN sudo apt-get update
RUN sudo apt-get install -y google-chrome-stable

#COPY ./chrome64_51.0.2704.84.deb /chrome64_51.0.2704.84.deb
#RUN dpkg --install /chrome64_51.0.2704.84.deb || sudo apt-get install -y -f && dpkg --install /chrome64_51.0.2704.84.deb

RUN google-chrome --version

RUN wget -q -O - http://mozilla.debian.net/archive.asc | sudo apt-key add -
RUN sudo sh -c 'echo "deb http://mozilla.debian.net/ jessie-backports firefox-release" >> /etc/apt/sources.list.d/mozilla-firefox.list'
RUN sudo sh -c 'echo "Package: * \ 
Pin: origin mozilla.debian.net \
Pin-Priority: 501 \
" >> /etc/apt/preferences.d/mozilla-firefox'
RUN sudo apt-get update
RUN sudo apt-get install -y -t jessie-backports firefox

#RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
#RUN sudo apt-get clean
#RUN sudo apt-get update
#RUN sudo apt-get install -y nodejs build-essential
