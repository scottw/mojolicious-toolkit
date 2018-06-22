#!/usr/bin/env perl
use strict;
use warnings;
use Mojo::UserAgent;
use Mojo::Util 'trim';
use Data::Dumper;
use feature 'say';

my $url = 'https://www.wunderground.com/weather/us/ma/burlington';
my $ua = Mojo::UserAgent->new;
my $result = $ua->get($url)->result;
my $loc = trim $result->dom->at('city-header h1')->text;

my $temp = $result->dom->at('.current-temp .wu-value')->text;
printf "%-24s: %.2f °F\n", $loc, $temp;
