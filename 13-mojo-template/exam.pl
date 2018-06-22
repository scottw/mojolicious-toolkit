#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::Template;

my $mt = Mojo::Template->new;

my $tmpl = <<'EOF';
    <div>
      <h1><%= $title %></h1>

      % for (1..5) {
      <p>Count: <%= $_ %></p>
      % }
    </div>
EOF

say $mt->vars(1)->render($tmpl, {title => 'Hello World!'});
