use strict;
use warnings;
use autodie;

my $number_seqs = scalar @ARGV;

if($number_seqs != 2){
  print "Please provide two sequences \n";
}

if (length $ARGV[0] != length $ARGV[1]){
        print "Please ensure the sequences are the same length \n";
        exit;
}

my $counter = 0;
for (0..(length $ARGV[0]) - 1){
    my $first = (split //, $ARGV[0])[$_];
    my $second = (split //, $ARGV[1])[$_];

    if ($first ne $second){
        my $pos = $_++;
        print "pos $pos: $first => $second\n";
        $counter = $counter+1;
    }
}

printf "Found %1.0f SNPs\n", $counter;


 
