#!/usr/bin/perl

$line = <>;

($head, $epc, $tail) = split(", ",$line);
print $epc,"\n";

while (<>) {
    ($head, $epc, $tail) = split(", ");
}

print $epc,"\n";
