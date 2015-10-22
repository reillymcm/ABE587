#!/usr/bin/env perl
# file: 01-palindrome.pl
use strict;
use warnings;
use autodie;


my $string = shift or die "Please provide a word or phrase.\n";
my $text = lc $string;

$text =~ s/[^A-Za-z0-9]//g;

printf "%s\n", ($text eq reverse($text)) ? "Yes" : "No";