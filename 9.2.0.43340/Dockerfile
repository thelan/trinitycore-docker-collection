FROM ubuntu:20.04 AS BUILDER
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git clang cmake make gcc g++ libmariadbclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip libmariadb-client-lgpl-dev-compat && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

WORKDIR /usr/src
ARG COMMIT=5002e5d3524eab201c6c219cd60a9f7d6188ed54
RUN git clone -b master https://github.com/TrinityCore/TrinityCore.git && cd TrinityCore && git checkout ${COMMIT}
ARG NBPROC=1

#ADD patches /usr/src/patches/
#RUN cd /usr/src/TrinityCore && git apply /usr/src/patches/*

RUN cd /usr/src/TrinityCore && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/opt/trinitycore/conf -DTOOLS=1 && \
    make -j ${NBPROC} && make install

WORKDIR /opt/trinitycore

