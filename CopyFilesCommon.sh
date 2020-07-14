#!/bin/bash
# this needs to be in the same directory as the CMakeLists directory
# The CMakeLists dir contains all the CMakeLists
# their extention in teh directory they go in

# pass in the Site directory
# i.e. ~/workspace/Bitbucket OSBI 
SRC_DIR=$1/$2/src


echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "Source Directory is: " $SRC_DIR
echo "Destination Directory is: " $1
echo "Site is: " $2

echo "Move Configurator files".
mkdir $1/cfg
mv $SRC_DIR/cfs.c $1/cfg
mv $SRC_DIR/cfs.h $1/cfg
cp CMakeLists/CMakeListsCFG.txt $1/cfg/CMakeLists.txt

mkdir $1/cfg/CFG_files
mv $SRC_DIR/CFGagency.c $1/cfg/CFG_files
mv $SRC_DIR/CFGcode.c $1/cfg/CFG_files
mv $SRC_DIR/CFGcomp.c $1/cfg/CFG_files
mv $SRC_DIR/CFG.h $1/cfg/CFG_files
mv $SRC_DIR/CFGlicense.c $1/cfg/CFG_files
mv $SRC_DIR/CFGrole.c $1/cfg/CFG_files
mv $SRC_DIR/CFGspcl.c $1/cfg/CFG_files
mv $SRC_DIR/CFGstation.c $1/cfg/CFG_files
mv $SRC_DIR/CFGuser.c $1/cfg/CFG_files
mv $SRC_DIR/CFGvcode.c $1/cfg/CFG_files
mv $SRC_DIR/CFGwdt.c $1/cfg/CFG_files
v
echo "Move Common files".
mkdir $1/common
mkdir $1/common/src
cp TimsFiles/copyExe.sh $1/common/src
cp TimsFiles/makeHeaders.sh $1/common/src

mkdir $1/common/src/crypto
mkdir $1/common/src/crypto/shrfips140
cp CMakeLists/CMakeListsCommonSrcCrypto140.txt $1/common/src/crypto/shrfips140/CMakeLists.txt
mv $SRC_DIR/FoxCryptoFips140.c $1/common/src/crypto/shrfips140

mkdir $1/common/src/foxlibs
mkdir $1/common/src/foxlibs/shrfox
cp CMakeLists/CMakeListsCommonSrcFoxLibFox.txt $1/common/src/foxlibs/shrfox/CMakeLists.txt
mv $SRC_DIR/Labortex.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lagencyfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Laplqadd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Laplqdel.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Laudadd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Laudget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lbfrget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lbfrrtn.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcmdque.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lconfupd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcontrolget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcontrolset.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcryptdec.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcryptenc.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcryptkey.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lcryptrijndael.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Ldatepul.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lfldscan.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lfldtlu.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lfoxinit.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lfoxopen.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgennap.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgensema.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgensgnh.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgensgnl.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgensoff.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lgenson.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lhdrdata.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lhtradd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lhtrget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Llicenseaton.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Llicensefind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Llicensentoa.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Llockreset.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Llockset.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmatchprofile.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmdiradd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmdirdel.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmdirget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmdirmod.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmkefind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmriadd.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmriget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmsgdeq.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmsgsend.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lmsgstnbit.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lnetevnt.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lotherauth.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lqueckpt.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lqueclose.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lqueget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lqueio.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lroleapplfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lrolecmndfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lrolefind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lroleotherfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lrolerolesfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lshmget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lstnctrs.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lstnfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lstnlog.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lstnntm.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lstrsend.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Ltimefmt.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lusrfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lversionfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lvhdrget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lvhdrmod.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lvhdrput.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwdtdelexp.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwdtfind.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwdtmonitor.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwsclose.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwsget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwsopen.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwsput.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwsrtn.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lwssend.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lxsget.c $1/common/src/foxlibs/shrfox
mv $SRC_DIR/Lxsrtn.c $1/common/src/foxlibs/shrfox

mkdir $1/common/src/include
mv $SRC_DIR/LPROTOTYPES.h $1/common/src/include
mv $SRC_DIR/Mfox.h $1/common/src/include

mkdir $1/common/src/interfaces

mkdir $1/common/src/opaid
mv $SRC_DIR/OAinterface.c $1/common/src/opaid
mv $SRC_DIR/OAMON.c $1/common/src/opaid
mv $SRC_DIR/OASSM.c $1/common/src/opaid
mv $SRC_DIR/OASTAT.c $1/common/src/opaid

mkdir $1/common/src/postproc
cp CMakeLists/CMakeListsCommonSrcPostProc.txt $1/common/src/postproc/CMakeLists.txt

mkdir $1/common/src/switch
mv $SRC_DIR/ALERTS.c $1/common/src/switch
cp CMakeLists/CMakeListsCommonSrcSwitch.txt $1/common/src/switch/CMakeLists.txt
mv $SRC_DIR/CP.c $1/common/src/switch
mv $SRC_DIR/D1.c $1/common/src/switch
mv $SRC_DIR/ED.c $1/common/src/switch
mv $SRC_DIR/foxcreate.c $1/common/src/switch
mv $SRC_DIR/foxsizes.c $1/common/src/switch
mv $SRC_DIR/HP.c $1/common/src/switch
mv $SRC_DIR/INTSRV.c $1/common/src/switch
mv $SRC_DIR/IP.c $1/common/src/switch
mv $SRC_DIR/iplfox.c $1/common/src/switch
mv $SRC_DIR/JQ.c $1/common/src/switch
mv $SRC_DIR/JT.c $1/common/src/switch
mv $SRC_DIR/JW.c $1/common/src/switch
mv $SRC_DIR/JX.c $1/common/src/switch
mv $SRC_DIR/OP.c $1/common/src/switch
mv $SRC_DIR/OR.c $1/common/src/switch
mv $SRC_DIR/PS.c $1/common/src/switch
mv $SRC_DIR/RC.c $1/common/src/switch
mv $SRC_DIR/RK.c $1/common/src/switch
mv $SRC_DIR/SM.c $1/common/src/switch
mv $SRC_DIR/TI.c $1/common/src/switch
mv $SRC_DIR/TR.c $1/common/src/switch
mv $SRC_DIR/watchdog.c $1/common/src/switch



mkdir $1/common/src/tools
mkdir $1/common/src/tools/config
mv $SRC_DIR/printwd.c $1/common/src/tools/config
mv $SRC_DIR/zm.c $1/common/src/tools/config
mv $SRC_DIR/zp.c $1/common/src/tools/config
mv $SRC_DIR/zs.c $1/common/src/tools/config

mkdir $1/common/src/tools/utl
mv $SRC_DIR/ahtoi.h $1/common/src/tools/utl
mv $SRC_DIR/bumpforms.c $1/common/src/tools/utl
mv $SRC_DIR/cedit.c $1/common/src/tools/utl
mv $SRC_DIR/csvUsers.c $1/common/src/tools/utl
mv $SRC_DIR/dumpdbx.c $1/common/src/tools/utl
mv $SRC_DIR/hd.c $1/common/src/tools/utl
mv $SRC_DIR/liconfig.c $1/common/src/tools/utl
mv $SRC_DIR/makeconfigs.c $1/common/src/tools/utl
mv $SRC_DIR/shmdump.c $1/common/src/tools/utl
mv $SRC_DIR/ssmtest.c $1/common/src/tools/utl
mv $SRC_DIR/st.c $1/common/src/tools/utl
mv $SRC_DIR/Table.c $1/common/src/tools/utl
mv $SRC_DIR/wsdump.c $1/common/src/tools/utl
mv $SRC_DIR/zckpt.c $1/common/src/tools/utl
mv $SRC_DIR/zdat.c $1/common/src/tools/utl
mv $SRC_DIR/zdi.c $1/common/src/tools/utl
mv $SRC_DIR/zdr.c $1/common/src/tools/utl
mv $SRC_DIR/zque.c $1/common/src/tools/utl





mkdir $1/common/xsl

