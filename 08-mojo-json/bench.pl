#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Benchmark 'timethese';
use Mojo::JSON;
use Cpanel::JSON::XS;

my $data = `cat test.json`;

timethese(10_000,
          {
             mojo => sub { Mojo::JSON::decode_json($data) },
             xs => sub { Cpanel::JSON::XS::decode_json($data) },
          }
);
