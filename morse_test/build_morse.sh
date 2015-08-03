#! /bin/sh

set -e

SRCDIR=/src/morse
BUILDDIR=/build
INSTALLDIR=/opt/morse
OUTDIR=/out

if [ ! -d ${SRCDIR} ]; then
	mkdir -p $(dirname ${SRCDIR})
	cd $(dirname ${SRCDIR})
	git clone https://github.com/morse-simulator/morse.git
else
	cd ${SRCDIR}
	git pull 
fi

if [ ! -d ${BUILDDIR} ]; then
	mkdir ${BUILDDIR}
fi

cd ${BUILDDIR}

cmake ${SRCDIR} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} -DBUILD_ROS_SUPPORT=OFF -DBUILD_YARP_SUPPORT=OFF
make 
make install

export PYTHONPATH=${INSTALLDIR}/lib/python3/dist-packages/:${PYTHONPATH}
export PATH=${INSTALLDIR}/bin/:${PATH}

Xvfb -screen 0 1024x768x24 :1 >/dev/null 2>&1 &
export DISPLAY=:1

mkdir -p ${OUTDIR}
ctest --verbose > ${OUTDIR}/morse_tests_$(date +%G_%m_%d_%H_%M).log 2>&1 
