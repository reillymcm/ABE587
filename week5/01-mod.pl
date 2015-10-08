#!/usr/bin/perl 
# file: 01-mod.pl
use strict;
use warnings;
use autodie;


if(not @ARGV){
  print "Please provide a list of numbers. \n";
}



my @even_numbers_array = ();



for (my $i=0; $i<scalar @ARGV ; $i++){
	if ($ARGV[$i] % 2 ==0){
            push(@even_numbers_array, $ARGV[$i]);
        }   
}


print "evens=", join( ',', @even_numbers_array ),"\n";

