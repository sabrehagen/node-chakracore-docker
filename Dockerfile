FROM ubuntu:16.04

ENV NODE_VERSION=v8.2.1 NPM_VERSION=5

RUN apt-get update && apt-get install -y git curl make gcc g++ clang python openssl

RUN curl -sSL https://github.com/nodejs/node-chakracore/releases/download/node-chakracore-${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz | tar xz

RUN cd /node-${NODE_VERSION}-linux-x64 && cp -r * /usr/local

RUN rm -rf /node-${NODE_VERSION}-linux-x64 \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

