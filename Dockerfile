#
# Dockerfile for xmrig
# usage: docker build -t xmrig:latest.
# run: docker run --name xmrig --restart unless-stopped -d xmrig:latest [XMRIG EXECUTABLE ARGUMENTS]
#

FROM ubuntu:latest

ENV XMRIG_DIR $HOME_DIR/xmrig
ENV XMRIG_BUILD_DIR $XMRIG_DIR/build
ENV USER 41vQQqGeEMmWNNvXhpDme9aCDktYDSNtwJ1Ed1prZQ4yj7NksCdGt6zbWkVkthoCLfj2M1ct31zrka2fAXiExYBa7jCcSf2
ENV ADDRESS pool.supportxmr.com:5555

RUN pwd

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get update && apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev gcc-7 g++-7 -y

RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build
RUN cd xmrig/build && cmake ..
RUN cd xmrig/build && make
RUN mv xmrig/build/xmrig rich
