#!/usr/bin/env perl
use Mojolicious::Lite;

app->validator->add_check(
    range => sub {
        my ($validation, $name, $value, $min, $max) = @_;
        return $value < $min || $value > $max;
    }
);

post '/signup' => sub {
    my $c     = shift;
    my $valid = $c->validation;

    $valid->required('name')->size(1, 10)->like(qr/^[a-z]/);
    $valid->required('age')->range(18, 40);
    $valid->required('state')->in(qw/UT TX CA OR ID/);
    $valid->required('city')->like(qr/^[A-Z]/);

    return $c->render('400') if $valid->has_error;

    $c->render(text => "Welcome " . $valid->param('name'));
};

app->start;

__DATA__
@@ 400.html.ep
<html>
  <head>
    <title>Sorry</title>
  </head>
  <body>
    <p>Your fault:</p>
    <pre>
    % for my $field (@{validation->failed}) {
        Error!: <%= $field %><br/>
    % }
  </body>
</html>
