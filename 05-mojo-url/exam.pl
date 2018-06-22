#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;
use Mojo::URL;

my $url = Mojo::URL->new('http://joe:passwd@example.com:3000/foo?foo=bar#23');
say $url->scheme;
say $url->userinfo;
say $url->host;
say $url->port;
say $url->path;
say $url->query;
say $url->fragment;
