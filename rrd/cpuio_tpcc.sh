sh create_cpu_rrd.sh rrd/cpu_tpcc100_4k.rrd
sh create_io_rrd.sh rrd/io_tpcc100_4k.rrd
perl push_cpuio2.pl rrd/cpu_tpcc100_4k.rrd rrd/io_tpcc100_4k.rrd logs/io_tpcc100_4k_0.log
sh graph_cpu.sh 1381302300 1381303300 rrd/cpu_tpcc100_4k.rrd graph/cpu_tpcc100_4k.png
sh graph_io.sh 1381302300 1381303300 rrd/io_tpcc100_4k.rrd graph/io_tpcc100_4k.png
