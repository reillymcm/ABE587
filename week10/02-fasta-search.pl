#!/usr/bin/env perl

=head1 NAME

new-pl - stub out a new Perl script

=head1 SYNOPSIS

  new-pl <script-name-or-path> [description]

Options:

  -n|--name        You full name ("John Smith")
  -e|--email       Your email address
  -c|--copyright   Who gets the copyright
  -p|--perl        Preferred Perl for shebang line
  --help           Show brief help and exit

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
use "Bio::SeqIO"
use "Bio::DB:Fasta"

main();

# --------------------------------------------------
sub main {
	my $input_file = shift ;

	my $seq_in  = Bio::SeqIO->new(
							-file   => $input_file,
                              -format => 'fasta',
    );
    my $out_SeqIO_Obj = Bio::SeqIO-> new(-format => 'fasta');
    
    while (my $seq_object = $seqIO_object ->next_seq) {
    	my $id = $seq_object ->id;
    	my $desc = $seq_object ->desc;
    	my $seqString = $seq_object ->seq
    	my $revComp = $seq_object ->revcom
    	my $alphabet = $seq_object ->alphabet;
    	my $translation_seq_obj = $seq_object -> translate;
    	my $translation = $translation_seq_obj ->seq;
    	my $seqLen = $seq_object ->length;
    	
    	print "translation: $translation\n"
    	
    	$out_seqIO_Obj->write_seq($seq_object);
# --------------------------------------------------
sub main {
	my $dbfile = shift || 'uniprot_sprot.fasta';
	my $db_obj = Bio::DB::Fasta->new ($dbfile)
	
	my $id = shift
	my $seq_obj = $db_obj->get_Seq_by_id($id)
	
	if ($seq_obj) {
		print "seq: ",$seq_obj->seq, "\n"
	} else {
		warn ("Cannot find $id\n");
	}
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

Options:

  --help   Show brief help and exit
  --man    Show full documentation

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