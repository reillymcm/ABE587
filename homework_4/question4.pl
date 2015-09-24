#!usr/bin/perl                                                                                            
#question1.pl
use strict;
use warnings;


my $input = 'Perl_III.fastq';
open IN, "<", $input or die "cannot read input: $!\n"; 


my $number_of_lines = 0;
my $total_length = 0;

while (my $line = <IN>){
      chomp $line;
      $number_of_lines++;
      my $length = length ($line);
      my $total_length = $total_length += $length;
}

my $average_length = $total_length/$number_of_lines;

print "Total number of lines =", $number_of_lines, "\n";
print "Total length = ", $total_length, "\n";
print "Average line length= ", $average_length, "\n";

