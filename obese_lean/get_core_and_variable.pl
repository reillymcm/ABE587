#!/usr/bin/perl 
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# concatenated the output text files into cat_uproc.outs.txt
my $file1 = shift || 'cat_uproc_outs.txt';
open my $f1, '<', $file1;


my $outfile1 = 'core_IDs.txt';
open(my $fh1, '>', $outfile1) or die "Could not open file '$outfile1' $!";

my $outfile2 = 'variable_IDs.txt';
open(my $fh2, '>', $outfile2) or die "Could not open file '$outfile2' $!";


my %names = ();
while (my $line = <$f1>) {
    chomp $line;
    my ($name, $length) = split /,/, $line, 2; 
    if ($length >= 50 ) {
        push @{ $names{$name} }, $length; # save $length for $name
    }
}

foreach my $name (sort keys %names) {
    if(scalar @{ $names{$name} } >= 4) { 
 
   
            print $fh1 $name, "\n";
    }
    else {
            print $fh2 $name, "\n";
        
    }
}
