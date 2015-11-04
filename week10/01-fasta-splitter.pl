#!/usr/bin/env perl

=head1 NAME

new-pl - stub out a new Perl script

=head1 SYNOPSIS

  new-pl <script-name-or-path> [description]

  Options (defaults in parentheses):

 		  --number  The maxmimum number of sequences per file (500)
          --out_dir Output directory (cwd)
          --help    Show brief help and exit
          --man     Show full documentation


=head1 DESCRIPTION

This script will stub out a new Perl script with POD sections and
basic optional handling and usage printing.

Unless the script name is an absolute path (e.g., "/tmp/foo"), the
created script will be placed into the current working directory.  An
optional description can be provided to place into the POD.

You can put all the above options into a "~/.newplrc" file, e.g.:

    full_name=Ken Youens-Clark
    email=kyclark@email.arizona.edu
    perl_path=/uaopt/perl/5.14.2/bin/perl
    copyright=Hurwitz Lab

=head1 AUTHOR

Ken Youens-Clark E<lt>kyclark@gmail.com<gt>.

=head1 COPYRIGHT

Copyright (c) Ken Youens-Clark

This library is free software;  you can redistribute it and/or modify 
it under the same terms as Perl itself.

=cut

# --------------------------------------------------

use strict;
use warnings;
use autodie;
use Cwd;
use Config;
use English qw(-no_match_vars);
use Env qw($EDITOR);
use File::Basename;
use File::Spec::Functions;
use Getopt::Long;
use IO::Prompt;
use Template;
use Perl6::Slurp;
use Bio::SeqIO;

main();

# --------------------------------------------------
sub main 
my $from = shift;
my $to = shift;
my $seqs = shift;

my $in  = new Bio::SeqIO(-file  => $from);

my $count = 0;
my $fcount = 1;
my $out = new Bio::SeqIO(-file => ">$to.$fcount", -format=>'fasta');
while (my $seq = $in->next_seq) {
        if ($count % $seqs == 0) {
                $fcount++;
                $out = new Bio::SeqIO(-file => ">$to.$fcount", -format=>'fasta');
        }
        $out->write_seq($seq);
        $count++;
}
# --------------------------------------------------


# --------------------------------------------------

__DATA__
[%- SET pod_prefix = '='       -%]
[%- SET end_tag    = '__END__' -%]
#![% perl_path %]

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
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

[% end_tag %]

# --------------------------------------------------

[% pod_prefix %]pod

[% pod_prefix %]head1 NAME

[% fname %][% IF desc; " - $desc"; END %]

[% pod_prefix %]head1 SYNOPSIS

  [% fname %] 

  Options (defaults in parentheses):

          --number  The maxmimum number of sequences per file (500)
          --out_dir Output directory (cwd)
          --help    Show brief help and exit
          --man     Show full documentation

[% pod_prefix %]head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

[% pod_prefix %]head1 SEE ALSO

perl.

[% pod_prefix %]head1 AUTHOR

[% full_name %] E<lt>[% email_address %]E<gt>.

[% pod_prefix %]head1 COPYRIGHT

Copyright (c) [% year %] [% copyright OR full_name %]

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

[% pod_prefix %]cut