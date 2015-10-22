#!/usr/bin/perl 
# file: 02-fasta-hash.pl 
use strict;
use warnings;
use autodie;


my $file1 = shift || 'Perl_V.genesAndSeq.txt';
open my $f1, '<', $file1;

my %seqs;
my $id; 
my $dna;

while (my $line = <$f1>)
{
    chomp $line;

    if ($line =~ / ^ > (.+) /x)
    {
        $seqs{$id} = $dna if defined $id;
        $id        = $1;
        $dna       = '';
    }
    else
    {
        $dna      .= $line;
    }
}

$seqs{$id} = $dna if defined $id;

for my $key (sort { length $seqs{$a} <=> length $seqs{$b} } keys %seqs){
    printf "%s:%d\n", $key, length $seqs{$key};
}



