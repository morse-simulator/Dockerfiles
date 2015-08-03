#! /bin/sh

set -e

SRCDIR=/src/morse
BUILDDIR=/build
INSTALLDIR=/opt/morse
OUTDIR=/out

. /opt/ros/indigo/setup.sh


if [ ! -d ${SRCDIR} ]; then
	mkdir -p $(dirname ${SRCDIR})
	cd $(dirname ${SRCDIR})
	git clone https://github.com/morse-simulator/morse.git
else
	cd ${SRCDIR}
	git pull 
fi

mkdir -p ${BUILDDIR}
cd ${BUILDDIR}

cmake ${SRCDIR} -DBUILD_DOC_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${INSTALLDIR}
make 

mkdir -p ${OUTDIR}/
cp -r ${BUILDDIR}/doc/html/ ${OUTDIR}



