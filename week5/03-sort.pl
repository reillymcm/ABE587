#!/usr/bin/env perl 
# file: 03-sort.pl
use strict;
use warnings;
use autodie;

if ( !@ARGV ) {
    die "provide a list of numbers \n";
}

my @default_sort = sort @ARGV;
print "default sort = ", join( ', ', @default_sort ), "\n";

my @numerical_sort = sort { $a <=> $b } @ARGV;
print "numerical sort = ", join( ', ', @numerical_sort ), "\n";

my @reverse_sort = sort { $b cmp $a } @ARGV;
print "reverse numerical sort = ", join( ', ', @reverse_sort ), "\n";
