#!/usr/bin/env perl
use strict;
use warnings;
use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

print $ua->get('https://www.hostgator.com/')->result->body;
