#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SearchIO;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my $file = shift or pod2usage("Need BLAST output file");
my $in = Bio::SearchIO->new(-format=> 'blast', -file=> $file);


while (my $result = $in->next_result) {
    while (my $hit = $result->next_hit) {
        while (my $hsp = $hit->next_hsp) {
            if ($hsp->evalue < 1e-050) {
                say join "\t", 
                    $hsp->query_string,
                    $hsp->hit_string,
                    $hsp->evalue;
            }
        }
    }
}




say "OK";

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__