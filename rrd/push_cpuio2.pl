#!/usr/bin/perl
use Scalar::Util ( looks_like_number );

my $RRD_PATH=$ENV{PWD};
#my $RRDCPU_FILE="tpcc_cpu01.rrd";
#my $RRDIO_FILE="tpcc_io01.rrd";
my $RRDCPU_FILE=$ARGV[0];
my $RRDIO_FILE=$ARGV[1];
my $LOG_FILE=$ARGV[2];

my $RRD_CMD="/usr/local/bin/rrdtool";
my $RRD_UPDATE="update";
my $cdate, $cbody;

$RRDCPU_FILE = $RRD_PATH . '/' . $RRDCPU_FILE;
$RRDIO_FILE = $RRD_PATH . '/' . $RRDIO_FILE;

while (<>) {
    chomp;
    my @value = split(', ');
    shift @value;
    my $epoch = shift(@value);
    my $pcpu = shift(@value);

    if (looks_like_number($value[1])) {
	$RRD_OPT = join(":",@value);
	$RRD_OPT = sprintf("$epoch:") . $RRD_OPT;
	if ($pcpu =~ /cpu/) {
	    @arg = ($RRD_CMD, $RRD_UPDATE, $RRDCPU_FILE, $RRD_OPT);
	} else {
	    @arg = ($RRD_CMD, $RRD_UPDATE, $RRDIO_FILE, $RRD_OPT);
	}
#        printf("@arg\n");
        system(@arg);
    }
}
