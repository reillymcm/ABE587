#!/usr/bin/env perl
# file: 04-restriction.pl
use strict;
use warnings;
use autodie;

# R^AATTY..... R = A or G..... Y = C or T....

my $input = shift or die "Please provide a sequence or file. \n" ;


foreach ($input) {
    open my $fh, '<', $input;
    ($input = join ' ', <$fh>) =~ s/\s//g;
}

$input =~ s/([AG])(AATT[CT])/$1^$2/g;
print $input; #modified input