#!/usr/bin/perl
use Scalar::Util ( looks_like_number );

my $RRD_PATH=$ENV{PWD};
my $RRD_FILE=$ARGV[0];
my $RRD_CMD="/usr/local/bin/rrdtool";
my $RRD_UPDATE="update";
my $LOG_FILE=$ARGV[1];

print $RRD_FILE,"\n";
print $LOG_FILE,"\n";

$RRD_FILE = $RRD_PATH . '/' . $RRD_FILE;
open(LOGFILE,$LOG_FILE);

while (<LOGFILE>) {
    chomp;
    my @value = split(', ');
    shift @value;
    my $epoch = $value[0];
    shift @value;
    if (looks_like_number($value[2])) {
        $RRD_OPT = join(":",@value);
        $RRD_OPT = sprintf("$epoch:") . $RRD_OPT;

        @arg = ($RRD_CMD, $RRD_UPDATE, $RRD_FILE, $RRD_OPT);
        #printf("$RRD_CMD $RRD_UPDATE $RRD_FILE $RRD_OPT\n");
	system(@arg);
    }
}
