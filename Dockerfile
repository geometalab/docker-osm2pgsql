FROM ubuntu:14.04

MAINTAINER Mirko Stocker <mirko@stocker.email>

RUN apt-get update && apt-get install -y git-core \
  build-essential libxml2-dev libgeos++-dev libpq-dev \
  libboost-dev libboost-system-dev libboost-filesystem-dev \
  libboost-thread-dev libbz2-dev libproj-dev libtool automake \
  libprotobuf-c0-dev protobuf-c-compiler lua5.2 \
  liblua5.2-0 liblua5.2-dev liblua5.1-0

ENV HOME /root

RUN mkdir src &&\
  cd src &&\
  git clone https://github.com/openstreetmap/osm2pgsql.git &&\
  cd osm2pgsql &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install

ENTRYPOINT ["/bin/bash"]

