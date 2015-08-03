FROM ubuntu:14.04
MAINTAINER Arnaud Degroote <arnaud.degroote@isae-supaero.fr>

# Prepare stuff for ROS (test and doc)
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 0xB01FA116

RUN apt-get update && apt-get install -y \
	cmake \
	git \
	g++ \
	pkg-config \
	blender \
	python3-dev \
	python3-numpy \
	python3-sphinx \
	ros-indigo-ros-base \ 
	ros-indigo-pr2-controllers-msgs \
	ros-indigo-move-base-msgs \
	ros-indigo-actionlib-msgs \
	ros-indigo-control-msgs \
	python-rosinstall \
	python-catkin-tools \
	python3-setuptools 

# setup rosdep
RUN rosdep init && rosdep update

# install python3 version of rospkg, catkin-tools required by Morse
RUN easy_install3 pip
RUN pip3 install rospkg catkin-tools

COPY build_morse.sh /

ENTRYPOINT /bin/sh /build_morse.sh
