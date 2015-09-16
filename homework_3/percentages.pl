#!/usr/bin/env perl 
# file: percentages.pl
use strict;
use warnings;

my $i = shift ;
my $j = shift ;

if (abs($i) != abs($j)) {
	print "The result is: ", ($i/($i+$j))*100 ,"% \n" ;
} else {
	print "You are trying to trick me! \n" ;
}




