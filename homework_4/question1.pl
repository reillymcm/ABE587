#!/usr/bin/env perl                                                                                            
# question1.pl
use strict;
use warnings;

my $x = shift;
my $y = shift;

my $error        = "division_error.txt";
my $quotient_out = 'quotient.out';

#open (STDOUT, '>',  $quotient_out) || die "cannot write to STDOUT : $!\n";
#open (STDERR, '>', $error) || die "cannot write to error: $!\n";

if (not defined $x) {
    print "provide two numbers \n";
}

elsif (not defined $y) {
    print "provide two numbers \n";
}
elsif ($y == 0) {
    print "divisor cannot be zero\n";
}
if (defined $x && defined $y) {
    if ($x > 0 && $y > 0) {
        my $quotient = $x / $y;
        print STDOUT $quotient, "\n";
    }
    else {
        print STDERR "use only positive numbers. \n";
    }
}

