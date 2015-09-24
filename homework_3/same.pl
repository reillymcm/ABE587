#!/usr/bin/env perl 
# file: same.pl
use strict;
use warnings;

print "enter string 1 \n" ;
my $string1 = <STDIN> ;

print "enter string 2 \n" ;
my $string2 = <STDIN> ;

if ($string1 eq $string2) {
	print "same \n" ;
} else {
	print "different \n" ;
}


	
