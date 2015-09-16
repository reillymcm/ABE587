#!/usr/bin/env perl 
# file: reorder.pl
use strict;
use warnings;

my $string1 = shift ;
my $string2 = shift ;

if ($string2 ge $string1) {
	print $string1," ", $string2, "\n" ;
} else {
	print $string2, " ",$string1, "\n"
}
