#!/usr/bin/env perl 
# file: 02-mod-sort-sum.pl
use strict;
use warnings;
use autodie;


if(not @ARGV){
  print "provide a list of numbers \n";
}


my $even_sum = 0;
my $odd_sum = 0;

for (my $i=0; $i<scalar @ARGV ; $i++){
	if ($ARGV[$i] % 2 ==0){
			$even_sum += $ARGV[$i];		
 	}else{
 			$odd_sum += $ARGV[$i];
	}	
}

print "sum evens =", $even_sum, "\n" ;

print "sum odds =", $odd_sum, "\n";





