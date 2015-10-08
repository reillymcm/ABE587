#!/usr/bin/env perl 
# file: 05-string-sort.pl
use strict;
use warnings;
use autodie;


if(not @ARGV){
  print "Please provide a list of sequences \n" ;
}


my @default_sort = ();
@default_sort =  sort @ARGV;
print "sorted = ", join(',', @default_sort),"\n";


my @reverse_sort = ();
@reverse_sort =  sort {$b cmp $a} @ARGV;
print "reverse = ", join(',', @reverse_sort),"\n";
