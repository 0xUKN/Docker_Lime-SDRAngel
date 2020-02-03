#!/bin/sh

xhost +
docker run --net=host --env="DISPLAY" --env="PULSE_SERVER=unix:/run/user/1000/pulse/native" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="/dev/bus/usb:/dev/bus/usb:rw" --volume="/run/user/1000/pulse:/run/user/1000/pulse:rw" --privileged lime-sdrangel:latest
