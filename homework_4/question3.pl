#!/usr/bin/perl
#File: revvvvv.pl
use strict;
use warnings;

my $fa_input  = 'Perl_III.fasta.txt';
my $fa_output = 'reversecomplement.fasta.txt';
if (! defined($fa_input) or ! defined($fa_output)) {
    die "need <in.fasta> <out.fasta>\n";
} else {
    open(IN, '<', $fa_input) or die "cannot open $fa_input: $!\n";
    open(OUT,'>',$fa_output) or die "cannot open $fa_output: $!\n";
    
my $header;
my $sequence = '';
	while (my $line = <IN>) {
    chomp($line);
    
    if ($line =~ /^>/) {
	if (length($sequence) > 0) {
	   print(OUT $header," reverse-complement\n",$sequence,"\n");
	       $sequence = '';
}
	$header = $line; #
} else {
	
	$line =~ tr/atcgATCG/tagcTAGC/;
	$sequence = reverse($line).$sequence;
}
}
    if (length($sequence) > 0) {
 
      print(OUT $header," reverse-complement\n",$sequence,"\n");
}
    close(OUT);
    close(IN);
}
