#!/usr/bin/env perl 
# file: same2.pl
use strict;
use warnings;

print "enter string 1 \n" ;
my $string1 = <STDIN> ;

print "enter string 2 \n" ;
my $string2 = <STDIN> ;

if (lc($string1) eq lc($string2)) {
	print "same \n" ;
} else {
	print "different \n" ;
}


	