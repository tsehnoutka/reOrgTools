#!/bin/bash


printf "Make links to Cmake list\n"
printf "File location: $1/common/CMakeLists\n"
printf "Link location: $1/$2/src/\n"
cd $1/$2 
echo `pwd`
ln -s ../../../../common/CMakeLists/foxlibs/shrtoken/CMakeLists.txt $1/$2/src/foxlibs/shrtoken/CMakeLists.txt
ln -s ../../../../common/CMakeLists/foxlibs/shrxml/CMakeLists.txt $1/$2/src/foxlibs/shrxml/CMakeLists.txt
ln -s ../../../common/CMakeLists/interfaces/CMakeLists.txt $1/$2/src/interfaces/CMakeLists.txt
ln -s ../../../common/CMakeLists/opaid/CMakeLists.txt $1/$2/src/opaid/CMakeLists.txt
ln -s ../../../common/CMakeLists/switch/CMakeLists.txt $1/$2/src/switch/CMakeLists.txt

test -d "$1/$2/src/cfg" || mkdir -p "$1/$2/src/cfg"
ln -s ../../../common/CMakeLists/cfg/CMakeLists.txt $1/$2/src/cfg/CMakeLists.txt

ln -s ../common/.gitignore $1/$2/.gitignore

