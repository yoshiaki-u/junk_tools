sh create_qps_rrd.sh rrd/qps_tpcc100_4k.rrd
perl push_qps.pl rrd/qps_tpcc100_4k.rrd logs/qps_tpcc100_4k_0.log
sh graph_qps.sh 1381302300 1381303300 rrd/qps_tpcc100_4k.rrd graph/qps_tpcc100_4k.png

