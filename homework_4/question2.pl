#!usr/bin/perl                                                                                            
#question2.pl
use strict;
use warnings;
 
my $input = 'Perl_III.nobody.txt';
my $output = 'NOBODY_UC.out';
 
open IN, "<", $input or die "cannot read imput: $!\n";
open OUT, ">", $output or die "cannot write output: $!\n";
 
while (my $line = <IN>){
    chomp $line;
    my $UC_line = uc $line;
    print OUT "$UC_line \n";
}