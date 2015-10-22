#!/usr/bin/env perl 
# file: 07-gc.pl
use strict;
use warnings;
use autodie;

if ( ! @ARGV ) {
    print "Please provide a sequence \n";
}

my $number_seqs = scalar @ARGV;

for ( my $i = 0 ; $i < $number_seqs ; $i++ ) {
    my $length_array = length $ARGV[$i];
    my $number_of_letters =
      ( $ARGV[$i] =~ tr/G/G/ + $ARGV[$i] =~ tr/C/C/ + $ARGV[$i] =~
          tr/g/g/ + $ARGV[$i] =~ tr/c/c/ );
    my $percent_of_letters = ( $number_of_letters / $length_array ) * 100;

    # print to screen
    print "-------\n";
    print "Seq : ", "$ARGV[$i]", "\n";
    print "Length: ", $length_array,      "\n";
    print "#GC: ",    $number_of_letters, "\n";
    printf "%%GC: %5.3f \n", $percent_of_letters;
}

__END__

Much easier to use "for my $seq (@ARGV) {...}" than a c-style for loop.
