FROM debian:jessie

#USER root
RUN apt-get clean
RUN apt-get upgrade
RUN apt-get update
RUN apt-get install -y curl xvfb unzip wget git
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y google-chrome-stable
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs build-essential
RUN npm install chimp -g
#RUN Xvfb :99 -screen 0 1024x768x24 &> xvfb.log &
#ENV DISPLAY=:99.0
#RUN export DISPLAY
ENV HOME=/srv/package
WORKDIR ${HOME}

COPY ./node_modules/ ${HOME}/node_modules/

# Copy the stuff which might change a bit more
COPY ./package.json ${HOME}/package.json

# Copy the stuff which we imagine may have changed - if we are doing a build
COPY ./chimp.config.js ${HOME}/chimp.config.js
COPY ./spec/ ${HOME}/spec/

CMD ["npm", "run-script", "chimp-headless"]
