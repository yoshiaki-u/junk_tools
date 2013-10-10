#!/bin/sh
WORKDIR=$PWD
RRDFILE=tpcc_cpu01.rrd
RRDTOOL=/usr/local/bin/rrdtool
STARTTIME=$1
ENDTIME=$2
RRDFILE=$3
GRAPH_OUT=$4

$RRDTOOL graph ${WORKDIR}/${GRAPH_OUT} --width 500 --upper-limit=2  --height 150 --imgformat=PNG --start=${STARTTIME} --end=${ENDTIME} \
--title="cpu usage" \
--vertical-label="load " \
DEF:a_sens0="$WORKDIR/$RRDFILE":user:LAST \
DEF:a_sens1="$WORKDIR/$RRDFILE":nice:LAST \
DEF:a_sens2="$WORKDIR/$RRDFILE":sys:LAST \
DEF:a_sens3="$WORKDIR/$RRDFILE":iowait:LAST \
DEF:a_sens4="$WORKDIR/$RRDFILE":cpu:LAST \
LINE1:a_sens0#FF052A:"user " \
GPRINT:a_sens0:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens0:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens1#00FF00:"nice " \
GPRINT:a_sens1:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens1:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens2#0049FF:"sys " \
GPRINT:a_sens2:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens2:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens3#a8a904:"iowait " \
GPRINT:a_sens3:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens3:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens4#10191F:"cpu " \
GPRINT:a_sens4:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens4:MAX:"Max  \:%8.2lf %S\n" 
