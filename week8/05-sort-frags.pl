#!/usr/bin/env perl
# file: 05-sort-frags.pl
use strict;
use warnings;
use autodie;

my $input;

$input = \*STDIN;

chomp(my $lines = (join '', <$input>));
if ($lines) {
    print join "\n", sort { length($a) <=> length($b) } split(/\^/, $lines);
}

print "\n" ;