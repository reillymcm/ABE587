#!/usr/bin/env perl

use strict;
use feature 'say';
use File::Basename;
use Bio::SearchIO;

my $blast_out = shift or die sprintf("Usage: %s blast.out\n", basename($0));
my $min       = 1e-10;
my $searchio  = Bio::SearchIO->new( 
    -format   => 'blast',
    -file     => $blast_out,
);

say join "\t", qw[query hit evalue];
while (my $result = $searchio->next_result ) {
    while (my $hit = $result->next_hit) {
        while (my $hsp = $hit->next_hsp) {
            if ($hsp->significance <= $min) {
                say join "\t", 
                    $result->query_name,
                    $hit -> name,
                    $hit-> description,
                    $hsp->percent_identity,
                    $hsp->length('total'),
                    $hsp->evalue;


            }
        }
    }
}`
