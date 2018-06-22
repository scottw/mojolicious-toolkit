#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Test::Mojo;
use Test::More;

my $t = Test::Mojo->new;
$t->get_ok('https://mojolicious.org')
  ->status_is(200)
  ->text_like('div#wrapperlicious h1' => qr/Perl/);

$t->get_ok('https://api.twilio.com/2010-04-01.json')
  ->status_is(200)
  ->json_is('/subresource_uris/accounts' => "/2010-04-01/Accounts.json");

done_testing();
