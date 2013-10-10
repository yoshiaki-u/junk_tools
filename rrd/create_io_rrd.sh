#
# 
#
echo $1
START="1380000000"
rrdtool create $1 --start ${START} --step 10 \
DS:read:GAUGE:100:0:U \
DS:write:GAUGE:100:0:U \
RRA:LAST:0.1:1:100000

