FROM debian:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl

RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && npm install -g npm@latest

WORKDIR /usr/src/app
ONBUILD COPY package.json /usr/src/app/package.json
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app

CMD npm test
