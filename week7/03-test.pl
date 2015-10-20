#!/usr/bin/perl 
# file: 03-common-words.pl 
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $f1 = shift;
my $f2 = shift;

if (! defined($f1) or ! defined($f2)) {
	die "Need two text file names as arguments.  \n";
}


my %results;

open my $file1, '<', $f1;
while (my $line = <$file1>) {
    $line =~ s/[[:punct:]]//g;

    for my $word (split(/\s+/,$line)) {
         $word =~ s/[^A-Za-z0-9]//g;
         $results{lc $word} = 1;
    }
}


my @words2;
my @storage;
open my $file2, '<', $f2;
while (my $line = <$file2>) {
   $line =~ s/[[:punct:]]/ /g;
  @words2 = grep { /\S/ } split(/ /,$line);
    for (my $i=0; $i<scalar @words2; $i++){
	$words2[$i] = lc($words2[$i]);
      $words2[$i] =~ s/[^A-Za-z0-9]//g;
        
        push(@storage, $words2[$i]);
        if (grep {$_ eq $words2[$i]} @storage[0..$#storage-1]){
            $results{$words2[$i]} = 1;
        }else{
            $results{$words2[$i]}++;
        }
    }
}

my $counter = 0;
foreach my $words (sort { $results{$b} <=> $results{$a} } keys %results) {
    if ($results{$words} > 1){
        $counter = $counter+1;
        print $words, "\n\n" ;
    }
} 
printf "Found %1.0f words in common.\n", $counter;

