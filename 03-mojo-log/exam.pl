#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Mojo::Log;
use Mojo::Date;
use utf8;

my $log = Mojo::Log->new(path => 'my-log.log', level => 'warn');

$log->format(
    sub {
        my ($time, $level, @lines) = @_;
        my $l = 0;
        join "" => map { sprintf "[%s] [%s] %s\n",
                           Mojo::Date->new($time)->to_datetime, $level, $_ }
          map { ($l++ ? '+ ' : '') . $_ }
          @lines;
    }
);

$log->level('debug');

$log->debug('A debug message');
$log->info('Some information for you…', 'spread across', 'several lines', '☠️');

$log->level('warn');

$log->warn('Repent');
$log->debug("You won't see this message.");
$log->error('Please alert Robert');
$log->fatal('Sayonara');
