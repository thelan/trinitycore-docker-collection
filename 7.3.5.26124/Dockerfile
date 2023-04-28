FROM debian/eol:wheezy AS BUILDER

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes git clang make gcc g++ libmysqlclient-dev libbz2-dev libreadline-dev libcrypto++ libcrypto++-dev libssl-dev libncurses-dev python-dev p7zip wget #&& \
#    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
#    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

ARG COMMIT=31f6ba5a92b0f88f328e0e6adcf33bd4820599c2
ARG NBPROC=1

WORKDIR /usr/src
RUN git clone -b master https://github.com/TrinityCore/TrinityCore.git && cd TrinityCore && git reset --hard ${COMMIT}

ADD cmake-3.11.4.tar.gz /usr/src
RUN cd cmake-3.11.4 \
    && ./configure \
    && make -j ${NBPROC} \
    && make install

ADD boost_1_55_0.tar.gz /usr/src
RUN cd /usr/src/boost_1_55_0 && ./bootstrap.sh --prefix=/usr/ && ./b2

RUN apt-get install -y libclang-dev
RUN cd /usr/src/TrinityCore && mkdir build && cd build \
    && cmake .. -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/opt/trinitycore/conf -DTOOLS=1 \
	-DBOOST_ROOT=/usr/src/boost_1_55_0 \
	-DBOOST_LIBRARYDIR=/usr/src/boost_1_55_0/libs \
       # -DOPENSSL_ROOT_DIR=/usr/local/ssl \
       # -DOPENSSL_LIBRARIES=/usr/local/ssl/lib \
       # -DOPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
        -DWITH_WARNINGS=1 \
        -DSCRIPTS=static

RUN cd /usr/src/TrinityCore/build && make -j ${NBPROC}
RUN cd /usr/src/TrinityCore/build && make install

WORKDIR /opt/trinitycore

