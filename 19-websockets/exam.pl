#!/usr/bin/env perl
use Mojolicious::Lite;

my %conn;

app->helper(
    broadcast => sub {
        my $msg = sprintf "[%s] %s" => Mojo::Date->new->to_datetime, pop;
        $conn{$_}->send({ text => $msg }) for keys %conn;
    }
);

websocket '/echo' => sub {
    my $c = shift;
    my $conn = $c->tx->connection;

    $c->app->log->debug("Connection opened: $conn");
    $conn{$conn} = $c->tx;
    $c->broadcast("($conn has joined)");

    $c->inactivity_timeout(300);

    $c->on(
        text => sub {
            my ($c, $message) = @_;
            my $conn = $c->tx->connection;

            $c->app->log->debug("Text payload received from $conn: $message");
            $c->broadcast("$conn: $message");
        }
    );

    $c->on(
        finish => sub {
            my $c    = shift;
            my $conn = $c->tx->connection;

            $c->app->log->debug("Connection closed: $conn");
            delete $conn{$conn};
            $c->broadcast("($conn has left)");
        }
    );
};

get '/' => 'index';

app->start;
__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
  <head>
    <title>Echo</title>
    <script>
      var ws = new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + "/echo");
      ws.onmessage = function (event) {
        document.body.innerHTML += '<hr/>' + event.data;
        document.getElementById("message").focus();
      };
    </script>
  <body>
    <input type="text" id="message" onkeyup="if (event.keyCode == 13) {ws.send(this.value)}">
  </body>
  </head>
</html>
