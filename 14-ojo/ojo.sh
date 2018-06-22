perl -Mojo -E 'get "/" => {inline => "%= time"}; app->start' get /
