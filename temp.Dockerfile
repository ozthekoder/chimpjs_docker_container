# vim: set ft=Dockerfile:

FROM weareathlon/chimpjs-xfvb:0.1
USER root
RUN apt-get update 
RUN apt-get -y install apt-utils bzip2 

RUN npm install chimp -g
