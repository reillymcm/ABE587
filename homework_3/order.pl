#!/usr/bin/env perl 
# file: order.pl
use strict;
use warnings;

my $string1 = shift ;
my $string2 = shift ;

if ($string2 ge $string1) {
	print "right order \n" ;
} else {
	print " wrong order \n"
}



