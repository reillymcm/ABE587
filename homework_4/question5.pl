#!/usr/bin/env perl
#File: question5.pl

use strict;
use warnings;

my $inputfile = 'Perl_III.nobody.txt';
open (IN, '<', $inputfile)
	or die "could not open $inputfile: $!\n";

while (my $line = <IN>) {
    chomp($line);
    
    $line = uc $line;
    my $nobody   = index($line,'NOBODY');
    my $somebody = index($line,'SOMEBODY');
    if ($nobody >= 0) {
    warn("Nobody is here: $nobody.\n");
    }
    if ($somebody >= 0) {
    warn("Somebody is here: $somebody.\n");
    }
}
