use Plack::Builder;
use Plack::App::Directory;
use strict;
use warnings;

my $html_app = Plack::App::Directory->new({ root => "./public/html" })->to_app;
my $css_app = Plack::App::Directory->new({ root => "./public/css" })->to_app;
my $js_app = Plack::App::Directory->new({ root => "./public/js" })->to_app;

builder {
    enable "Rewrite", rules => sub { s|^/$|/index.html| };
    mount "/css" => $css_app;
    mount "/js"  => $js_app;
    mount "/"    => $html_app;
}
