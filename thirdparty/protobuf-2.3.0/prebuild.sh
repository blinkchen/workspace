#!/bin/sh

if [[ $# -ne 5 ]]; then
	echo "prebuild failed, missing WORK_DIR() and OUT_DIR() and build_dynamic_flag and build_release_flag build_bit_flag"
	exit 1
fi

curdir="`pwd`"
bitextend="32"
if [[ $5 -ne 0 ]]; then
       bitextend="64"
fi
direxetend="debug"
if [[ $4 -ne 0 ]]; then
	direxetend="release"
fi
libdir="lib${bitextend}_${direxetend}"
libexetend="a"
if [[ $3 -ne 0 ]]; then
	libexetend="so"
fi
software_package="protobuf-2.3.0.tar.bz2"		#软件包
software_dir="protobuf-2.3.0"					#软件包加压后目录
liball=(protobuf protobuf-lite protoc)			#生成的库

buildok="YES"
	mkdir -p tmp $libdir $1/$2/
	cd $software_dir
	if [[ $bitextend == "32" ]]; then
	        export LDEMULATION="elf_i386"
	elif [[ $bitextend == "64" ]]; then
	        export LDEMULATION="elf_x86_64"
	else
	        export LDEMULATION="elf_i386"
	fi
	./configure CFLAGS="-g -O2 -m${bitextend}" CXXFLAGS="-g -O2 -m${bitextend}" CPPFLAGS="-g -O2 -m${bitextend}" --prefix=${curdir}/tmp/ > config.out 2>&1
	if [[ $? -eq 0 ]]; then
		make > make.out 2>&1
		if [[ $? -eq 0 ]];then
			make install > makeinstall.out 2>&1
			if [[ $? -eq 0 ]]; then
				cd -
				cp -rf ${curdir}/tmp/include ./
				for libfile in ${liball[@]}
				do
					cp -f ${curdir}/tmp/lib/lib${libfile}.${libexetend} ${curdir}/$libdir/
					cp -f ${curdir}/tmp/lib/lib${libfile}.${libexetend} $1/$2/
				done
	#			rm -rf $software_dir ${curdir}/tmp
			else
				echo "make install > makeinstall.out 2>&1 failed"
				buildok="NO"
			fi
		else
			echo "make 2>make.out 1>&2 failed"
			buildok="NO"
		fi
	else
		echo "./config --prefix=../tmp threads shared failed"
		buildok="NO"
	fi
fi

if [[ "X$buildok" = "XNO" ]];then
	exit 1
else
	exit 0
fi

