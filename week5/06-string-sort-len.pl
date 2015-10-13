#!/usr/bin/env perl 
# file: 06-string-sort-len.pl
use strict;
use warnings;
use autodie;

if ( !@ARGV ) {
    die "Please provide a list of sequences \n";
}

my @default_sort = sort { length($a) <=> length($b) } @ARGV;
print "sorted = ", join( ', ', @default_sort ), "\n";

my @reverse_sort = sort { $b cmp $a } @ARGV;
print "reverse = ", join( ', ', @reverse_sort ), "\n";
