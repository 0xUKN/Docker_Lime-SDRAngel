FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git build-essential cmake wget libusb-1.0-0-dev usbutils udev -y

WORKDIR /sources
RUN git clone https://github.com/myriadrf/LimeSuite --progress
WORKDIR LimeSuite/builddir
RUN cmake .. && make -j4 && make install && ldconfig
WORKDIR /sources/LimeSuite/udev-rules
RUN ./install.sh

WORKDIR /sources/sdrangel
RUN wget https://github.com/f4exb/sdrangel/releases/download/v4.13.0/sdrangel_4.13.0-1_amd64.deb
RUN apt-get install ./sdrangel_4.13.0-1_amd64.deb -y

COPY pulse-client.conf /etc/pulse/client.conf
WORKDIR /root

CMD sdrangel
