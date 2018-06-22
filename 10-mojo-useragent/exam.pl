#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

my $url = 'https://api.twilio.com/2010-04-01/Accounts.json';
say $ua->post($url)->result->json('/message');
