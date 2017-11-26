#
# Dockerfile for xmrig
# usage: docker build -t xmrig:latest.
# run: docker run --name xmrig --restart unless-stopped -d xmrig:latest [XMRIG EXECUTABLE ARGUMENTS]
#

FROM ubuntu:latest

ENV HOME_DIR $PWD
ENV XMRIG_DIR $HOME_DIR/xmrig
ENV XMRIG_BUILD_DIR $XMRIG_DIR/build
ENV USER 41vQQqGeEMmWNNvXhpDme9aCDktYDSNtwJ1Ed1prZQ4yj7NksCdGt6zbWkVkthoCLfj2M1ct31zrka2fAXiExYBa7jCcSf2
ENV ADDRESS pool.supportxmr.com:5555

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:jonathonf/gcc-7.1 -y

RUN apt-get update && apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev gcc-7 g++-7 -y

RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir $XMRIG_BUILD_DIR
RUN cd $XMRIG_BUILD_DIR && cmake $XMRIG_DIR -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7
RUN cd $XMRIG_BUILD_DIR && make
RUN mv xmrig rich
