#!/usr/bin/env perl 
# file: add2.pl
use strict;
use warnings;

my $x = shift ;
my $y = shift ;

if (defined($x) & defined($y)) {
	print "The sum is: ", $x+$y, "\n" ;
} else {
	print " Please provide two numbers \n"
}




