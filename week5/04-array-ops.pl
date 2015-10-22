#!/usr/bin/env perl 
# file: 04-array-ops.pl
use strict;
use warnings;
use autodie;


#print array joined on commas
my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
print "array = ",  join(', ', @array), "\n";


my $last_element = pop @array;
print "popped: $last_element";
print ", array = ", join (', ', @array) , "\n";


my $first_element = shift @array;
print "shifted: $first_element";
print ", array = ", join (', ', @array) , "\n";
 
 
my $number = 12;                          
push(@array, $number);
print "after push, array = ", join (', ', @array) , "\n";


my $number2 = 4;                          
unshift(@array, $number2);
print "after unshift, array = ", join (', ', @array) , "\n";
