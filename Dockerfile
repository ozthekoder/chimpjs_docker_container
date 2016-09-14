FROM debian:jessie

RUN apt-get clean
RUN apt-get upgrade
RUN apt-get update
RUN apt-get install -y curl xvfb unzip wget git

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get install oracle-java8-set-default

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable

RUN apt-get install -y iceweasel
#RUN wget -q -O - http://mozilla.debian.net/archive.asc | apt-key add -
#RUN sh -c 'echo "deb http://mozilla.debian.net/ jessie-backports firefox-release" >> /etc/apt/sources.list.d/mozilla-firefox.list'
#RUN sh -c 'echo "Package: * \ 
#Pin: origin mozilla.debian.net \
#Pin-Priority: 501 \
#" >> /etc/apt/preferences.d/mozilla-firefox'
#RUN apt-get update
#RUN apt-get install -y -t jessie-backports firefox

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs build-essential

RUN npm install chimp -g
