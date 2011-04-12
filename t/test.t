use Test::More;

use GD::Barcode::Code93;

my $b = new_ok('GD::Barcode::Code93', [ 'abc' ], 'new() ok');
cmp_ok( $b->{text}, 'eq', 'ABC', 'init ok' );
cmp_ok( $b->barcode,'eq', '1010111101101010001101001001101000101011001001000110101010111101', 'barcode() ok');

my $img = $b->plot;
ok( ( defined $img and ref $img eq 'GD::Image' ), 'plot() ok' );
TODO: {
    local $TODO = 'Binary output of GD images appears different on different platforms, or GD builds. Not sure yet.';
    cmp_ok( length $img, '==', 27, 'image appears correct length' );
};

done_testing;
