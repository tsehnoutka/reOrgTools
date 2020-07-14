#!/bin/bash


# pass in the Site directory
# i.e. CopyFiles.sh ~/ws/source OSBI 
SRC_DIR=$1/$2/src


echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "Source Directory is: " $SRC_DIR
echo "Destination Directory is: " $1
echo "Site is: " $2



mkdir $1/$2/src/foxlibs
mkdir $1/$2/src/foxlibs/shrtoken
mv $SRC_DIR/HOTP.c $1/$2/src/foxlibs/shrtoken
mv $SRC_DIR/md5.c $1/$2/src/foxlibs/shrtoken

mkdir $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/listMacro.h $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/utils.c $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/utils.h $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/XML.c $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/XML_new.h $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/XML.cpp $1/$2/src/foxlibs/shrxmlrxml
mv $SRC_DIR/XMLSPCL.c $1/$2/src/foxlibs/shrxml
mv $SRC_DIR/xml_testNew.c $1/$2/src/foxlibs/shrxml

mkdir $1/$2/src/include
mv $SRC_DIR/CMD_AUTH.h $1/$2/src/include
mv $SRC_DIR/ebcdic-ascii.h $1/$2/src/include
mv $SRC_DIR/fox.h $1/$2/src/include
mv $SRC_DIR/foxappl_ACCOUNT.h $1/$2/src/include
mv $SRC_DIR/foxappl_ON2_TEST.h $1/$2/src/include
mv $SRC_DIR/foxappl_TEST.h $1/$2/src/include
mv $SRC_DIR/foxbase64.c $1/$2/src/include
mv $SRC_DIR/foxbase64.h $1/$2/src/include
mv $SRC_DIR/foxclass.h $1/$2/src/include
mv $SRC_DIR/foxcmds.h $1/$2/src/include
mv $SRC_DIR/FoxCrypto.h $1/$2/src/include
mv $SRC_DIR/foxdisk.h $1/$2/src/include
mv $SRC_DIR/foxgen.h $1/$2/src/include
mv $SRC_DIR/foximage.h $1/$2/src/include
mv $SRC_DIR/foxtalk.h $1/$2/src/include
mv $SRC_DIR/HOTP.h $1/$2/src/include
mv $SRC_DIR/md5.h $1/$2/src/include
mv $SRC_DIR/OAhelper.h $1/$2/src/include
mv $SRC_DIR/OFMLerr.h $1/$2/src/include
mv $SRC_DIR/utils.h $1/$2/src/include
mv $SRC_DIR/XML.h $1/$2/src/include
mv $SRC_DIR/XML_new.h $1/$2/src/include


mkdir $1/$2/src/interfaces
mv $SRC_DIR/3270iac.c $1/$2/src/interfaces
mv $SRC_DIR/3270input.c $1/$2/src/interfaces
mv $SRC_DIR/3270io.c $1/$2/src/interfaces
mv $SRC_DIR/3270main.c $1/$2/src/interfaces
mv $SRC_DIR/3270net.c $1/$2/src/interfaces
mv $SRC_DIR/3270screen.c $1/$2/src/interfaces
mv $SRC_DIR/AOCdefs.h $1/$2/src/interfaces
mv $SRC_DIR/AOCfunc.c $1/$2/src/interfaces
mv $SRC_DIR/AOCmain.c $1/$2/src/interfaces
mv $SRC_DIR/AOCsql.c $1/$2/src/interfaces
mv $SRC_DIR/AOCsql.h $1/$2/src/interfaces
mv $SRC_DIR/ARCDB1.c $1/$2/src/interfaces
mv $SRC_DIR/ARCDB1.c $1/$2/src/interfaces
mv $SRC_DIR/ARCDB2.c $1/$2/src/interfaces
mv $SRC_DIR/ARCDB2.c $1/$2/src/interfaces
mv $SRC_DIR/ARCLDR.c $1/$2/src/interfaces
mv $SRC_DIR/BAILIF.c $1/$2/src/interfaces
mv $SRC_DIR/BMVIF.c $1/$2/src/interfaces
mv $SRC_DIR/CCHIF.c $1/$2/src/interfaces
mv $SRC_DIR/CHRI.c $1/$2/src/interfaces
mv $SRC_DIR/CHRI.h $1/$2/src/interfaces
mv $SRC_DIR/CHRI_SQL.c $1/$2/src/interfaces
mv $SRC_DIR/CHRI_SQL.h $1/$2/src/interfaces
mv $SRC_DIR/CCWIF.c $1/$2/src/interfaces
mv $SRC_DIR/CHS.c $1/$2/src/interfaces
mv $SRC_DIR/CHS.h $1/$2/src/interfaces
mv $SRC_DIR/DMPP.h $1/$2/src/interfaces
mv $SRC_DIR/DMXSRV.c $1/$2/src/interfaces
mv $SRC_DIR/e2atbl.c $1/$2/src/interfaces
mv $SRC_DIR/EWA.c $1/$2/src/interfaces
mv $SRC_DIR/EWA.h $1/$2/src/interfaces
mv $SRC_DIR/FNNCIF.c $1/$2/src/interfaces
mv $SRC_DIR/FTREMO.c $1/$2/src/interfaces
mv $SRC_DIR/FXTALK.c $1/$2/src/interfaces
mv $SRC_DIR/FXTCLI.c $1/$2/src/interfaces
mv $SRC_DIR/FXTINT.c $1/$2/src/interfaces
mv $SRC_DIR/HFS.c $1/$2/src/interfaces
mv $SRC_DIR/HFSEDIT.h $1/$2/src/interfaces
mv $SRC_DIR/HFS.h $1/$2/src/interfaces
mv $SRC_DIR/HFSN.c $1/$2/src/interfaces
mv $SRC_DIR/HFSN.h $1/$2/src/interfaces
mv $SRC_DIR/HFSTAB.h $1/$2/src/interfaces
mv $SRC_DIR/LICSRV.c $1/$2/src/interfaces
mv $SRC_DIR/MMMPIF.c $1/$2/src/interfaces
mv $SRC_DIR/NCITC2.c $1/$2/src/interfaces
mv $SRC_DIR/NCITCP.c $1/$2/src/interfaces
mv $SRC_DIR/NLETWS.c $1/$2/src/interfaces
mv $SRC_DIR/NLTTCP.c $1/$2/src/interfaces
mv $SRC_DIR/OVIP.c $1/$2/src/interfaces
mv $SRC_DIR/PORIF.c $1/$2/src/interfaces
mv $SRC_DIR/REMSRV.c $1/$2/src/interfaces
mv $SRC_DIR/VLD.c $1/$2/src/interfaces
mv $SRC_DIR/VLD.h $1/$2/src/interfaces
mv $SRC_DIR/WARIF.c $1/$2/src/interfaces
mv $SRC_DIR/WEATHR.c $1/$2/src/interfaces

mkdir $1/$2/src/opaid
#mv $SRC_DIR/COMMON.c $1/$2/src/opaid
#mv $SRC_DIR/common.c $1/$2/src/opaid/COMMON.c
mv $SRC_DIR/common.h $1/$2/src/opaid
mv $SRC_DIR/ebcdic-ascii.h $1/$2/src/opaid
#mv $SRC_DIR/FLOGMON.c $1/$2/src/opaid
#mv $SRC_DIR/flogmon.c $1/$2/src/opaid/FLOGMON.c
mv $SRC_DIR/flogmon.h $1/$2/src/opaid
#mv $SRC_DIR/FOXCMDS.c $1/$2/src/opaid
#mv $SRC_DIR/foxcmds.c $1/$2/src/opaid/FOXCMDS.c
mv $SRC_DIR/FOXMON.c $1/$2/src/opaid
mv $SRC_DIR/foxmon.c $1/$2/src/opaid/FOXMON.c
mv $SRC_DIR/foxmon.h $1/$2/src/opaid
mv $SRC_DIR/OABACKUP.c $1/$2/src/opaid
#mv $SRC_DIR/oabackup.c $1/$2/src/opaid/OABACKUP.c
#mv $SRC_DIR/OABackup.c $1/$2/src/opaid/OABACKUP.c
mv $SRC_DIR/OAbackup.h $1/$2/src/opaid
mv $SRC_DIR/OAconnections.c $1/$2/src/opaid
mv $SRC_DIR/OAconnections.h $1/$2/src/opaid
mv $SRC_DIR/OAdefs.h $1/$2/src/opaid
mv $SRC_DIR/OAencryption.c $1/$2/src/opaid
mv $SRC_DIR/OAencryption.h $1/$2/src/opaid
mv $SRC_DIR/OAerrors.c $1/$2/src/opaid
mv $SRC_DIR/OAerrors.h $1/$2/src/opaid
mv $SRC_DIR/OAfox.c $1/$2/src/opaid
mv $SRC_DIR/OAfox.h $1/$2/src/opaid
mv $SRC_DIR/OAhelper.c $1/$2/src/opaid
mv $SRC_DIR/OAinterface.c $1/$2/src/opaid
mv $SRC_DIR/OAinterface.h $1/$2/src/opaid
mv $SRC_DIR/OAmain.c $1/$2/src/opaid
mv $SRC_DIR/OAnet.c $1/$2/src/opaid
mv $SRC_DIR/OAnet.h $1/$2/src/opaid
mv $SRC_DIR/OAshared.h $1/$2/src/opaid
mv $SRC_DIR/OAwrappers.c $1/$2/src/opaid
mv $SRC_DIR/OAwrappers.h $1/$2/src/opaid
mv $SRC_DIR/RptCfgInfo.c $1/$2/src/opaid
mv $SRC_DIR/RptCfgInfo.h $1/$2/src/opaid
#mv $SRC_DIR/SYSMON.c $1/$2/src/opaid
#mv $SRC_DIR/sysmon.c $1/$2/src/opaid/SYSMON.c
mv $SRC_DIR/sysmon.h $1/$2/src/opaid
mv $SRC_DIR/trace.c $1/$2/src/opaid
mv $SRC_DIR/trace.h $1/$2/src/opaid
mv $SRC_DIR/trace_proc.c $1/$2/src/opaid
mv $SRC_DIR/WRS.c $1/$2/src/opaid
mv $SRC_DIR/wrs.c $1/$2/src/opaid/WRS.c
mv $SRC_DIR/wrs.h $1/$2/src/opaid

mkdir $1/$2/src/switch
mv $SRC_DIR/edit.c $1/$2/src/switch
mv $SRC_DIR/edit.h $1/$2/src/switch
mv $SRC_DIR/editspcl.c $1/$2/src/switch
mv $SRC_DIR/editspcl.h $1/$2/src/switch
mv $SRC_DIR/FM.c $1/$2/src/switch
mv $SRC_DIR/FM.h $1/$2/src/switch
mv $SRC_DIR/FMSPCL.c $1/$2/src/switch
mv $SRC_DIR/JJ.c $1/$2/src/switch
mv $SRC_DIR/JX.c $1/$2/src/switch
mv $SRC_DIR/JX.h $1/$2/src/switch
mv $SRC_DIR/JXSPCL.c $1/$2/src/switch
mv $SRC_DIR/OFMLerr.h $1/$2/src/switch
mv $SRC_DIR/OPSPCL.c $1/$2/src/switch
mv $SRC_DIR/RL.c $1/$2/src/switch
mv $SRC_DIR/RP.c $1/$2/src/switch
mv $SRC_DIR/RptCfgInfo.c $1/$2/src/switch
mv $SRC_DIR/RptCfgInfo.h $1/$2/src/switch
mv $SRC_DIR/RS.c $1/$2/src/switch
mv $SRC_DIR/RSspcl.c $1/$2/src/switch
mv $SRC_DIR/RU.c $1/$2/src/switch
mv $SRC_DIR/TISPCL.c $1/$2/src/switch
mv $SRC_DIR/TP.c $1/$2/src/switch
mv $SRC_DIR/UM.c $1/$2/src/switch
mv $SRC_DIR/US.c $1/$2/src/switch
mv $SRC_DIR/VA.c $1/$2/src/switch

./LinkMakeFiles.sh $1 $2



