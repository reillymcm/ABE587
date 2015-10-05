#!/usr/bin/env perl                                                                                            
#question2.pl
use strict;
use warnings;
use autodie;

my $input  = 'Perl_III.nobody.txt';
my $output = 'NOBODY_UC.out';

open my $IN,  "<", $input;
open my $OUT, ">", $output;

while (my $line = <$IN>) {
    chomp $line;
    my $UC_line = uc $line;
    print $OUT "$UC_line \n";
}
