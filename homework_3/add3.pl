#!/usr/bin/env perl 
# file: add3.pl
use strict;
use warnings;

my $x = shift ;
my $y = shift ;

if ($x >= 0 and $y >= 0) {
	print "The sum is: ", $x+$y, "\n" ;
} else {
	print " Please provide two positive numbers \n"
}



