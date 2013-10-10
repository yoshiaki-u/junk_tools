#
# 
#
echo $1
START="1380000000"
rrdtool create $1 --start ${START} --step 5 \
DS:select:GAUGE:100:0:U \
DS:insert:GAUGE:100:0:U \
DS:update:GAUGE:100:0:U \
RRA:LAST:0.1:1:1000000

