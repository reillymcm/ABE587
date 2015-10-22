#!/usr/bin/perl 
# file: 04-kmers.pl 
use strict;
use warnings;
use autodie;

######################################################

my $sequence_arg = shift;
if (not defined($sequence_arg)) {
	die "Provide a sequence please.  \n";
}
my $length_arg   = shift || 3;
if (-f $sequence_arg){
    open my $f1, '<', $sequence_arg;
    undef $sequence_arg;
    while (my $line = <$f1>) {
        $sequence_arg = $line;
        }
}
my $length_sequence_arg   = length($sequence_arg);
if (not defined($length_sequence_arg)) {
	die "Zero length sequence.  \n";
}
if (($length_sequence_arg - $length_arg) < 0) {
    die "Can not get any $length_arg mers from a sequence of length $length_sequence_arg\n";
}

######################################################

my $kmers_number = $length_sequence_arg-$length_arg+1;

my @mers; 
for (my $i=0; $i < $kmers_number; $i++) {
    $mers[$i] = substr($sequence_arg, $i, $length_arg);
}

my %seen = ();
my @uniq = ();
foreach my $i (@mers) {
    unless ($seen{$i}) {
        $seen{$i} = 1;        
        push(@uniq, $i);
    }
}

my $singleton = 0;
foreach my $i (@uniq) {
     
     my $count_foo = grep { $_ eq $i} @mers;
     if ($count_foo eq 1) {
          $singleton = $singleton+1;
      }
}

printf "%-15s %10s\n\n", "Sequence length", $length_sequence_arg;
printf "%-15s %10s\n\n", "Mer size", $length_arg;
printf "%-15s %10s\n\n", "Number of kmers", $kmers_number;
printf "%-15s %10s\n\n", "Unique kmers", scalar(@uniq);
printf "%-15s %10s\n\n", "Num. singletons", $singleton;

#my $count_foo2 = 0;
#my @count_foo3 = ();
if (scalar(@uniq) > 1){
    print "Most abundant\n\n";
    foreach my $i (@uniq) {
        #push($count_foo2, grep({ $_ eq $i} @mers));
        #push(@count_foo3, $i);
        my $count_foo2 = grep ({ $_ eq $i} @mers);
            if ($count_foo2 ne 1) {
                printf "%-8s %5s\n\n", $i, $count_foo2;
            }
    }
}
#print "@count_foo2";
#print "@count_foo3";