#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::Server::Daemon;
use Mojo::IOLoop;
use Mojo::Log;

my $handler = sub {
    my ($d, $tx) = @_;
    Mojo::Log->new->info("Request received by " . join ', ' => @{$d->ports});

    $tx->res->code(200);
    $tx->res->headers->content_type($tx->req->headers->content_type);
    $tx->res->body($tx->req->body);
    $tx->resume;
};

my @daemons = ();

for my $port (8080..8085) {
    my $daemon = Mojo::Server::Daemon->new(listen => ["http://*:$port"]);
    $daemon->on(request => $handler);
    $daemon->start;

    push @daemons, $daemon;
}

Mojo::IOLoop->start;
