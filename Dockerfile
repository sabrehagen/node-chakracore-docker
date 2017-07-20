FROM alpine:edge

ENV NODE_VERSION=v8.1.4 NPM_VERSION=5

RUN apk add --update --no-cache git curl clang cmake make gcc g++ python linux-headers binutils-gold libc6-compat bash grep && \
    curl -sSL https://github.com/nodejs/node-chakracore/archive/node-chakracore-${NODE_VERSION}.tar.gz | tar -xz && \
    cd /node-chakracore-${NODE_VERSION} && \
    ./configure --prefix=/usr --without-snapshot && \
    make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make install && \
    cd / && \
    npm install -g npm@${NPM_VERSION} && \
    apk del linux-headers binutils-gold && \
    rm -rf /etc/ssl /node-chakracore-${NODE_VERSION} \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
