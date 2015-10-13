#!/usr/bin/env perl 
# file: 01-mod.pl
use strict;
use warnings;
use autodie;


if ( !@ARGV ) {
    die "Please provide a list of numbers.\n";
}

my @even_numbers_array = ();

#for ( my $i = 0 ; $i < scalar @ARGV ; $i++ ) {
#    if ( $ARGV[$i] % 2 == 0 ) {
#        push( @even_numbers_array, $ARGV[$i] );
#    }
#}

for my $n (@ARGV) {
    if ( $n  % 2 == 0 ) {
        push @even_numbers_array, $n;
    }
}

print "evens = ", join( ', ', @even_numbers_array ), "\n";

__END__

Please format better.

Need to "die" right away on bad input so that execution stops and 
error goes to STDERR.
