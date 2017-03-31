#!/usr/bin/perl

use strict;
use warnings;
use IO::File;
use v5.16;

my $filename = @ARGV ? $ARGV[0] : 'deps';
my $deps_file = IO::File->new ($filename, 'r');

my @list = ();
while (defined (my $line = $deps_file->getline()))
{
    chomp ($line);
    my $level = index ($line, '--') - 1;
    next if $level < 0;
    if ($line !~ m!-- (([-@/.\w]+)@([\d.]+))!)
    {
        say "BAD LINE: $line";
        exit 1
    }
    push (@list, [$level, $2, $3]);
    # say $2 . " v" . $3 . " at " . $level;
}

my @sorted = sort {
    # reversed here, we want the highest levels first
    #my $result = ($b->[0] <=> $a->[0]);
    #if ($result != 0) {
#	return $result;
    #}
    my $result = ($a->[1] cmp $b->[1]);
    if ($result != 0) {
	return $result;
    }
    my @a_version_split = split (/\./, $a->[2]);
    my @b_version_split = split (/\./, $b->[2]);
    my $min_len = (@a_version_split < @b_version_split) ? @a_version_split : @b_version_split;
    for (my $i = 0; $i < $min_len; $i++)
    {
	$result = ($a_version_split[$i] <=> $b_version_split[$i]);
	if ($result != 0)
	{
	    return $result;
	}
    }

    return scalar(@a_version_split) <=> scalar(@b_version_split);
} @list;
undef (@list);

my $last_item = shift (@sorted);
my @deduped = ($last_item);
foreach my $item (@sorted)
{
    if (#$item->[0] == $last_item->[0] &&
	$item->[1] eq $last_item->[1] &&
	$item->[2] eq $last_item->[2])
    {
	next;
    }
    push (@deduped, $item);
    $last_item = $item;
}
undef (@sorted);

my @deps = map { "    '" . $_->[1] . '@' . $_->[2] . "'" } @deduped;
undef (@deduped);
my $install_file = IO::File->new ('install', 'w');
$install_file->say ('#!/usr/bin/bash');
$install_file->say ('# GENERATED, DO NOT MODIFY');
$install_file->say ('');
$install_file->say ('set -e');
$install_file->say ('');
$install_file->say ('npm install --verbose --global \\');
$install_file->say (join (" \\\n", @deps));
