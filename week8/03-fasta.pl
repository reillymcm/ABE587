#!/usr/bin/env perl
# file: 03-fasta.pl
use strict;
use warnings;
use autodie;



my $fasta = shift or die "Please provide a FASTA file.\n";
open my $fh, '<', $fasta ;

my $i = 0 ;
while (<$fh>) {
    if (/^>(.+)/) {
    print ++$i, ": ", $1, "\n" ;
    }
}


printf "Found %s sequence%s.\n", $i, $i == 1 ? '' : 's';



	