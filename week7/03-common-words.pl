#!/usr/bin/perl 
# file: 03-common-words.pl 
use strict;
use warnings;
use autodie;

my $f1 = shift;
my $f2 = shift;

if (! defined($f1) or ! defined($f2)) {
	die "Need two text file names as arguments.  \n";
}

my %results1;
open my $file1, '<', $f1;
while (my $line = <$file1>) {
    $line =~ s/[[:punct:]]//g;

    for my $word (split(/\s+/,$line)) {
         $word =~ s/[^A-Za-z0-9]//g;
         $results1{lc $word}++;
    }
}

my %results2;
open my $file2, '<', $f2;
while (my $line = <$file2>) {
    $line =~ s/[[:punct:]]//g;

    for my $word (split(/\s+/,$line)) {
         $word =~ s/[^A-Za-z0-9]//g;
         $results2{lc $word}++;
    }
}

my $counter = 0;
foreach my $i (sort keys %results1) {
    if (exists $results2{$i}) {
        print $i, "\n\n" ;
        $counter = $counter+1;
    }
}
printf "Found %1.0f words in common\n", $counter;

