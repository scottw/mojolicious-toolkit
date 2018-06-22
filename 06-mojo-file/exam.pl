#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::File;

my $path = Mojo::File->new('server.conf');
say "directory: " . $path->dirname;
say "basename:  " . $path->basename;
say $path->slurp;

Mojo::File->new('lib')
  ->list
  ->each(sub { say shift });
