FROM python:3.9.17-slim-bullseye

RUN apt-get update && apt install g++ make curl python3-pip -y

# RUN wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz && \
#     tar xzf Python-3.10.8.tgz && \
#     cd Python-3.10.8 && \
#     ./configure --enable-optimizations && \
#     make altinstall && \
#     apt install python3-pip -y

RUN cd /tmp && \
    curl -fSL https://github.com/nodejs/node/archive/refs/tags/v18.16.1.tar.gz -o node.tar.gz && \
    tar xzf node.tar.gz

COPY zlib/GN-scraper.py zlib/zlib.gyp /tmp/node-18.16.1/deps/zlib/

WORKDIR /tmp/node-18.16.1

RUN ./configure && \
    make -j4 && \
    node version