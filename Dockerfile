FROM debian:stable-slim

RUN apt-get update && apt install python3 g++ make python3-pip curl -y

RUN curl -fSL https://github.com/nodejs/node/archive/refs/tags/v18.16.1.tar.gz -o node.tar.gz && \
    tar xzf node.tar.gz

COPY zlib/GN-scraper.py zlib/zlib.gyp node-18.16.1/deps/zlib/

WORKDIR ./node-18.16.1

RUN ./configure && \
    make -j4 && \
    node version