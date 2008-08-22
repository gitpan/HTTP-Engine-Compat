use strict;
use warnings;
use HTTP::Engine::Compat;
use Scalar::Util qw/refaddr/;
use Test::More tests => 3;

my $c = HTTP::Engine::Compat::Context->new(
    req => HTTP::Engine::Request->new(
        _connection => {
            input_handle  => \*STDIN,
            output_handle => \*STDIN,
            env           => \%ENV,
        },
        request_builder => HTTP::Engine::RequestBuilder->new,
    )
);
is refaddr( $c->req ), refaddr( $c->request ),  'alias';
is refaddr( $c->res ), refaddr( $c->response ), 'alias';
is refaddr( $c->req->context ), refaddr($c), 'trigger';
