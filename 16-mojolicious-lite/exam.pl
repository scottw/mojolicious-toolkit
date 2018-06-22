#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;

  $c->render(json => { time => scalar localtime,
                       weather => 'partly clear' });
};

app->start;
