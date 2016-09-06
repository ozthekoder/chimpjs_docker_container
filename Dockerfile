FROM debian:jessie

RUN apt-get upgrade
RUN apt-get update
RUN apt-get install -y curl xvfb unzip wget git
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs build-essential
RUN npm install chimp -g
RUN Xvfb :99 -screen 0 1024x768x16 &> xvfb.log &
RUN DISPLAY=:99.0
RUN export DISPLAY

