#
# 
#
echo $1
START="1380000000"
rrdtool create $1 --start ${START} --step 10 \
DS:user:GAUGE:100:0:U \
DS:nice:GAUGE:100:0:U \
DS:sys:GAUGE:100:0:U \
DS:iowait:GAUGE:100:0:U \
DS:cpu:GAUGE:100:0:U \
RRA:LAST:0.1:1:100000

