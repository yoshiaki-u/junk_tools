#!/bin/sh
WORKDIR=$PWD
RRDTOOL=/usr/local/bin/rrdtool
STARTTIME=$1
ENDTIME=$2
RRDFILE=$3
GRAPH_OUT=$4

$RRDTOOL graph ${WORKDIR}/${GRAPH_OUT} --width 500 --height 150 --upper-limit 4000 --imgformat=PNG --start=${STARTTIME} --end=${ENDTIME} \
--title="query per sec" \
--vertical-label="query/sec   " \
DEF:a_sens0="$WORKDIR/$RRDFILE":select:LAST \
DEF:a_sens1="$WORKDIR/$RRDFILE":insert:LAST \
DEF:a_sens2="$WORKDIR/$RRDFILE":update:LAST \
LINE1:a_sens0#FF052A:"select " \
GPRINT:a_sens0:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens0:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens1#00FF00:"insert " \
GPRINT:a_sens1:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens1:MAX:"Max  \:%8.2lf %S\n" \
LINE1:a_sens2#0049FF:"update " \
GPRINT:a_sens2:AVERAGE:"average\:%8.2lf %s " \
GPRINT:a_sens2:MAX:"Max  \:%8.2lf %S\n" \

