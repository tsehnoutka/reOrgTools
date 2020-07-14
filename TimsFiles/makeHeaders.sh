#!/bin/bash
echo In makeHeaders.sh

CFG_DIR=$1
OPA_DIR=$2
OUT_DIR=$3

echo first: $IN_DIR
echo second: $OUT_DIR

rm -f $OUT_DIR/foxsizec.h 
rm -f $OUT_DIR/foxsizeo.h 

grep VERSION $CFG_DIR/configurator/6/cfs.c | grep '^#define' | grep -v 'PGM_V' > $OUT_DIR/foxsizec.h  
grep VERSION $OPA_DIR/opaid/WRS.c | grep '^#define' | grep -v 'PGM_V' | awk '{print $1 " OA"$2 " "$3}' > $OUT_DIR/foxsizeo.h


