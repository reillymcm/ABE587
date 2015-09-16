#!/usr/bin/env perl 
# file: percentages2.pl
use strict;
use warnings;

my $i = shift ;
my $j = shift ;

if (abs($i) != abs($j)) {
	printf "The result is %5.2f %% \n", ($i/($i+$j))*100 ;
} else {
	print "You are trying to trick me! \n" ;
}

