#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

use Mojo::File;
use Mojo::JSON 'decode_json';
use Mojo::JSON::Pointer;

my $json = Mojo::File->new(shift @ARGV)->slurp;

my $data = decode_json $json;

my $jp = Mojo::JSON::Pointer->new($data);

say $jp->get('/addons/1/rates/GBP/price');
