FROM ubuntu:14.04

MAINTAINER Mirko Stocker <mirko@stocker.email>

RUN DEBIAN_FRONTEND=noninteractive apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y\
    git-core\
    make\
    cmake\
    g++\
    libboost-dev\
    libboost-system-dev\
    libboost-filesystem-dev\
    libexpat1-dev\
    zlib1g-dev\
    libbz2-dev\
    libpq-dev\
    libproj-dev\
    lua5.2\
    liblua5.2-dev

ENV HOME /root

RUN mkdir src &&\
  cd src &&\
  git clone https://github.com/openstreetmap/osm2pgsql.git &&\
  cd osm2pgsql &&\
  mkdir build &&\
  cd build &&\
  cmake .. &&\
  make &&\
  make install
