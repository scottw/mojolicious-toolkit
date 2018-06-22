package Mojolicious::Plugin::TypeCast;
use Mojo::Base 'Mojolicious::Plugin';

use Scalar::Util 'looks_like_number';

sub register {
    my ($self, $app, $conf) = @_;

    $app->helper(
        to_integer => sub {
            my ($self, $hash, @keys) = @_;

            for my $key (@keys) {
                next unless exists $hash->{$key};
                $hash->{$key} ||= 0;  ## empty, undef are ok
                next unless looks_like_number($hash->{$key});
                $hash->{$key} += 0;
            }
        }
    );
}

1;
