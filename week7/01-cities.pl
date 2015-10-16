#!/usr/bin/env perl 
# file: 01-cities.pl 
use strict;
use warnings;
use autodie;
use Data::Dumper;

my %cities = (
	Albany   => 'NY',
	Portland => 'OR',
	SLC      => 'UT',
	Denver   => 'CO',
	Chicago  => 'IL',
	Tucson   => 'AZ',
);
	print Dumper(\%cities);
	

my @sorted = sort keys %cities;
my $n = 0;
	printf "%d: %s, %s\n", ++$n, $_, $cities{ $_ } for @sorted;
	
#retry 



	


