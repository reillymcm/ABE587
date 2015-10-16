#!/usr/bin/perl 
# file: 02-fasta-hash.pl 
use strict;
use warnings;
use autodie;


my (%sequences, $seq_key);

while (<>) {
    chomp;

    if (/^>/) {
        $seq_key = substr $_, 1;
    }
    else {
        $sequences{$seq_key} = $_;
    }
}

foreach my $key (
    sort {length $sequences{$a} <=> length $sequences{$b} } keys %sequences)
{
    my $len = length ($sequences{$key});
    print "$key:$len\n";
}

