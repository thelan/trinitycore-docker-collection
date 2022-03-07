FROM ubuntu:16.04 AS BUILDER
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git clang cmake make gcc g++ libmysqlclient-dev libssl-dev libbz2-dev libreadline-dev libcrypto++ libcrypto++-dev libncurses-dev libboost-all-dev mysql-server p7zip wget && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

ARG COMMIT=31f6ba5a92b0f88f328e0e6adcf33bd4820599c2
ARG OPENSSL_VERSION=1.0.2u
ARG NBPROC=1

# Compile and install Openssl
ENV CFLAGS=-fPIC
RUN cd /usr/src \
    && wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz \
    && tar xzf openssl-${OPENSSL_VERSION}.tar.gz && rm openssl-${OPENSSL_VERSION}.tar.gz \
    && cd openssl-${OPENSSL_VERSION} \
    && ./config shared --openssldir=/usr/src/openssl-${OPENSSL_VERSION} --prefix=/usr/local/ssl/ enable-ssl2 enable-ssl3 enable-tlsext enable-weak-ssl-ciphers enable-shared enable-md2 enable-rc5 enable-ssl-trace \
    && make -j ${NBPROC} && make test && make install

WORKDIR /usr/src
RUN git clone -b master https://github.com/TrinityCore/TrinityCore.git && cd TrinityCore && git reset --hard ${COMMIT}

    # cmake .. -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/opt/trinitycore/conf -DTOOLS=1 -DOPENSSL_ROOT_DIR=/usr/src/openssl-${OPENSSL_VERSION} -DOPENSSL_INCLUDE_DIR=/usr/src/openssl-${OPENSSL_VERSION}/include
RUN cd /usr/src/TrinityCore && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/opt/trinitycore/conf -DTOOLS=0  \
        -DOPENSSL_LIBRARIES=/usr/src/openssl-${OPENSSL_VERSION}/lib \
        -DOPENSSL_INCLUDE_DIR=/usr/src/openssl-${OPENSSL_VERSION}/include \
        -DOPENSSL_ROOT_DIR=/usr/src/openssl-${OPENSSL_VERSION} \
        -DWITH_WARNINGS=1 \
        -DSCRIPTS=dynamic
        #-DOPENSSL_CRYPTO_LIBRARIES=/usr/src/openssl-${OPENSSL_VERSION}/lib/libcrypto.a \
        #-DOPENSSL_SSL_LIBRARIES=/usr/src/openssl-${OPENSSL_VERSION}/lib/libssl.a \

RUN cd /usr/src/TrinityCore/build && make -j ${NBPROC}
RUN cd /usr/src/TrinityCore/build && make install

WORKDIR /opt/trinitycore

