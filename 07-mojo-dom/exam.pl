#!/usr/bin/env perl
use strict;
use warnings;
use Mojo::DOM;
use Mojo::File;
use feature 'say';

my $html = Mojo::File->new(shift @ARGV)->slurp;

my $dom = Mojo::DOM->new($html);

say $dom->at('#hosting-plans h1')->text;

$dom->find('ul.first-ul li')->each(sub { say $_->all_text });
