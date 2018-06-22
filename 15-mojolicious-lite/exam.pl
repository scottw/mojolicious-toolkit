#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
    my $c = shift;

    $c->stash(title => "All The Things!");

    $c->render(template => 'index', thanks => "Good job!");
};

app->start;
__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= $title %></title></head>
  <body>
  <h1>Welcome <%= $title %>

  <p>Thank you: <%= $thanks %>
</body>
</html>
