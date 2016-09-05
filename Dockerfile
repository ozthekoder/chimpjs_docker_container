FROM debian:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl

RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && npm install -g npm@latest
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
RUN /usr/bin/nvm install v6.2.0
RUN /usr/bin/nvm use 6.2.0

WORKDIR /usr/src/app
COPY package.json /usr/src/app/package.json
RUN npm install
COPY . /usr/src/app

CMD npm test
