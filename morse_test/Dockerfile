FROM ubuntu:14.04
MAINTAINER Arnaud Degroote <arnaud.degroote@isae-supaero.fr>

RUN apt-get update && apt-get install -y \
	cmake \
	git \
	g++ \
	pkg-config \
	blender \
	python3-dev \
	python3-numpy \
	xvfb

COPY build_morse.sh /
ENTRYPOINT /bin/sh /build_morse.sh
