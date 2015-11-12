#!/usr/bin/perl 
use strict;
use warnings;
use Bio::SearchIO;

my $blast = new Bio::SearchIO(
    -format => 'blast',
    -file   => $ARGV[0]);

my %Name;
my $result = $blast->next_result;
while(my $sbjct = $result->next_hit) {
    while(my $hsp = $sbjct->next_hsp) {
        $Name{$sbjct->name} = 1 if $hsp->evalue >= 1e-50;
    }
}

print join("\n", sort keys %Name), "\n";