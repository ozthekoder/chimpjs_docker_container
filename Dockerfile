FROM debian:jessie

RUN sudo apt-get upgrade
RUN sudo apt-get update
RUN sudo apt-get install -y curl xvfb unzip wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN sudo apt-get update
RUN sudo apt-get install -y google-chrome-stable
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
RUN npm install chimp -g
RUN Xvfb :99 -screen 0 1024x768x16 &> xvfb.log &
RUN DISPLAY=:99.0
RUN export DISPLAY
#RUN cpu_arch=$(lscpu | grep Architecture | sed "s/^.*_//")
#RUN version=$(curl 'http://chromedriver.storage.googleapis.com/LATEST_RELEASE' 2> /dev/null)
#RUN url_file="chromedriver_linux${cpu_arch}.zip"
#RUN url_base="http://chromedriver.storage.googleapis.com"
