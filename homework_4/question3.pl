#!/usr/bin/env perl

#File: revvvvv.pl
use strict;
use warnings;
use autodie;

my $fa_input  = 'Perl_III.fasta.txt';
my $fa_output = 'reversecomplement.fasta.txt';

if (!defined($fa_input) or !defined($fa_output)) {
    die "need <in.fasta> <out.fasta>\n";
}
else {
    open my $IN,  '<', $fa_input;
    open my $OUT, '>', $fa_output;

    my $header;
    my $sequence = '';
    while (my $line = <$IN>) {
        chomp($line);

        if ($line =~ /^>/) {
            if (length($sequence) > 0) {
                print $OUT $header, " reverse-complement\n", $sequence, "\n";
                $sequence = '';
            }
            $header = $line;    #
        }
        else {

            $line =~ tr/atcgATCG/tagcTAGC/;
            $sequence = reverse($line) . $sequence;
        }
    }

    if (length($sequence) > 0) {
        print $OUT $header, " reverse-complement\n", $sequence, "\n";
    }

    close($OUT);
    close($IN);
}
