FROM ubuntu:22.04 AS BUILDER
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git clang cmake make gcc g++ default-libmysqlclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev mariadb-server p7zip && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

WORKDIR /usr/src
#ARG COMMIT=429a7e75f33c4702eefcbe36892b7377b8e99321
ARG COMMIT=731217703819c26645944091f47aec63b45c25d4
RUN git clone -b master https://github.com/TrinityCore/TrinityCore.git && cd TrinityCore && git checkout ${COMMIT}
ARG NBPROC=1

#ADD patches /usr/src/patches/
#RUN cd /usr/src/TrinityCore && git apply /usr/src/patches/*

RUN cd /usr/src/TrinityCore && mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/opt/trinitycore/conf -DTOOLS=1 && \
    make -j ${NBPROC} && make install

WORKDIR /opt/trinitycore

