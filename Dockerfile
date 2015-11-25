FROM mooxe/node:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN cp /etc/apt/china/ubuntu /etc/apt/sources.list

RUN add-apt-repository ppa:chris-lea/zeromq && \
    add-apt-repository ppa:chris-lea/libpgm

# update
RUN aptitude update && \
    aptitude upgrade -y && \
    apt-get autoremove -y

RUN aptitude install -y make g++ libzmq3-dev

RUN bash -cl "cnpm config set unsafe-perm true" && \
    bash -cl "cnpm install -g zmq"
