#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::Date;

# From epoch
say Mojo::Date->new('784111777')->epoch;
say Mojo::Date->new('784111777.21')->epoch;

# From RFC 822/1123
say Mojo::Date->new('Sun, 06 Nov 1994 08:49:37 GMT')->epoch;

# From RFC 850/1036
say Mojo::Date->new('Sunday, 06-Nov-94 08:49:37 GMT')->epoch;

# From Ansi C asctime()
say Mojo::Date->new('Sun Nov  6 08:49:37 1994')->epoch;

# From RFC 3339
say Mojo::Date->new('1994-11-06T08:49:37Z')->epoch;
say Mojo::Date->new('1994-11-06T08:49:37')->epoch;
say Mojo::Date->new('1994-11-06T08:49:37.21Z')->epoch;
say Mojo::Date->new('1994-11-06T08:49:37+01:00')->epoch;
say Mojo::Date->new('1994-11-06T08:49:37-01:00')->epoch;

# To RFC 3339
say Mojo::Date->new(784111777.21)->to_datetime;
