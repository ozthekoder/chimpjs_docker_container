FROM debian:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl

RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN curl -sL https://deb.nodesource.com/setup_4.x | -E bash -
RUN apt-get install -y nodejs

WORKDIR /usr/src/app
COPY package.json /usr/src/app/package.json
RUN npm install
COPY . /usr/src/app

CMD npm test
