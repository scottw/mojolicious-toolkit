#!/usr/bin/env perl
use strict;
use warnings;
use Mojo::UserAgent;
use Mojo::Util 'trim';
use Mojo::Promise;

my @urls = (
    'https://www.wunderground.com/weather/us/tx/austin',
    'https://www.wunderground.com/weather/us/tx/houston',
    'https://www.wunderground.com/weather/us/fl/tampa',
    'https://www.wunderground.com/weather/us/fl/boca-raton',
    'https://www.wunderground.com/weather/us/ma/boston',
    'https://www.wunderground.com/weather/us/va/dulles',
    'https://www.wunderground.com/weather/us/ma/burlington',
    'https://www.wunderground.com/weather/us/ny/new-york',
    'https://www.wunderground.com/weather/us/ut/salt-lake-city',
    'https://www.wunderground.com/weather/us/or/portland',
    'https://www.wunderground.com/weather/us/me/portland',
    'https://www.wunderground.com/weather/us/az/tempe',
    'https://www.wunderground.com/weather/us/az/phoenix',
    'https://www.wunderground.com/weather/us/id/boise',
    'https://www.wunderground.com/weather/us/mt/butte',
    'https://www.wunderground.com/weather/us/ut/hurricane',
    'https://www.wunderground.com/weather/us/co/denver',
    'https://www.wunderground.com/weather/us/nv/reno',
    'https://www.wunderground.com/weather/us/nv/las-vegas',
    'https://www.wunderground.com/weather/us/ca/bakersfield',
    'https://www.wunderground.com/weather/us/ca/death-valley',
    'https://www.wunderground.com/weather/us/ak/anchorage',
    'https://www.wunderground.com/weather/us/ak/nome',
    'https://www.wunderground.com/weather/us/ia/des-moines',
    'https://www.wunderground.com/weather/us/il/chicago',
    'https://www.wunderground.com/weather/us/ut/moab',
    'https://www.wunderground.com/weather/us/ut/provo',
    'https://www.wunderground.com/weather/us/ut/logan',
    'https://www.wunderground.com/weather/us/wa/seattle',
    'https://www.wunderground.com/weather/us/wa/vancouver',
);

my $ua = Mojo::UserAgent->new;

my @promises = map { $ua->get_p($_) } @urls;

Mojo::Promise->all(@promises)->then(
    sub {
        for my $tx (map { $_->[0] } @_) {
            my $loc  = trim $tx->res->dom->at('city-header h1')->text;
            my $temp = $tx->res->dom->at('.current-temp .wu-value')->text;
            printf "%-24s: %.2f °F\n", $loc, $temp;
        }
    }
)->wait;

exit;
