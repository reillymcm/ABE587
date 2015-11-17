#!/usr/bin/perl 
use strict ;
use warnings ; 


my $fasta_file = shift or die "Please provide fasta file. \n";
my $seqs_per_file = shift || '2';  # whatever your batch size

my $file_number = 1;  # our files will be named like "something.fasta.1"
my $seq_ctr = 0;

open(FASTA, $fasta_file) || die("can't open $fasta_file");

while(<FASTA>) {

    if(/^>/) {

       # open a new file if we've printed enough to one file
       if($seq_ctr++ % $seqs_per_file == 0) {
         close(OUT);
         open(OUT, "> " . $fasta_file . "." . $file_number++);
       }

    }

    print OUT $_;

 }