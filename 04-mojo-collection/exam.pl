#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::Collection;

my $c = Mojo::Collection->new(qw(two three four nine seven ten twenty five eight));

$c->grep(qr/t/)->map(sub {ucfirst})->shuffle->each(
    sub {
        my $word = shift;
        say "WORD: $word";
    }
);
