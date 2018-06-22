#!/usr/bin/env perl
use Mojolicious::Lite;
use lib 'lib';

plugin 'TypeCast';

post '/' => sub {
    my $c = shift;
    my $json = $c->req->json;

    $c->to_integer($json, qw/foo bar/);

    $c->render(json => $json);
};

app->start;
