#!/bin/sh
WORKDIR=$PWD
RRDFILE=tpcc_test01.rrd
RRDTOOL=/usr/local/bin/rrdtool
STARTTIME=$1
ENDTIME=$2
RRDFILE=$3
GRAPH_OUT=$4

$RRDTOOL graph ${WORKDIR}/${GRAPH_OUT} --width 500 --height 150 --upper-limit 4000 --imgformat=PNG --start=${STARTTIME} --end=${ENDTIME} \
--title="Disk I/O" \
--vertical-label="Byte/Sec   " \
DEF:a_sens0="$WORKDIR/$RRDFILE":read:LAST \
DEF:a_sens1="$WORKDIR/$RRDFILE":write:LAST \
LINE1:a_sens0#FF052A:"Read " \
GPRINT:a_sens0:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens0:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens1#00FF00:"Write " \
GPRINT:a_sens1:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens1:MAX:"Max  \:%8.2lf %S\n" \


