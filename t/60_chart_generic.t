###############################################################################
#
# A test for Spreadsheet::WriteExcel::Chart.
#
# Tests for the Excel Chart.pm methods.
#
# reverse('�'), December 2009, John McNamara, jmcnamara@cpan.org
#

# prove -I../lib --nocolor -v 60_chart_generic.t

use strict;

use Spreadsheet::WriteExcel::Chart;

#use Test::More tests => 12;
use Test::More 'no_plan';


###############################################################################
#
# Tests setup
#
my $chart = Spreadsheet::WriteExcel::Chart->new();
my $got;
my $expected;
my $caption;
my $string;
my @values;

###############################################################################
#
# Test the _store_fbi method.
#
$caption = " \tChart: _store_fbi()";

$expected = join ' ', qw(
  60 10 0A 00 B8 38 A1 22 C8 00 00 00 05 00
);

$got = unpack_record( $chart->_store_fbi( 5, 10 ) );

is( $got, $expected, $caption );

###############################################################################
#
# Test the _store_fbi method.
#
$expected = join ' ', qw(
  60 10 0A 00 B8 38 A1 22 C8 00 00 00 06 00
);

$got = unpack_record( $chart->_store_fbi( 6, 10 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_chart method.
#
$caption = " \tChart: _store_chart()";

$expected = join ' ', qw(
  02 10 10 00 00 00 00 00 00 00 00 00 E0 51 DD 02
  38 B8 C2 01
);

$got = unpack_record( $chart->_store_chart() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_series() method.
#
$caption = " \tChart: _store_series()";

$expected = join ' ', qw(
  03 10 0C 00 01 00 01 00 08 00 08 00 01 00 00 00
);

@values = ( 1, 1, 8, 8, 1, 0 );

$got = unpack_record( $chart->_store_series( @values ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_begin() method.
#
$caption = " \tChart: _store_begin()";

$expected = join ' ', qw(
  33 10 00 00
);

$got = unpack_record( $chart->_store_begin() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_end() method.
#
$caption = " \tChart: _store_end()";

$expected = join ' ', qw(
  34 10 00 00
);

$got = unpack_record( $chart->_store_end() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_ai() method.
#
$caption = " \tChart: _store_ai()";

@values = ( 0, 1, 0, '' );

$expected = join ' ', qw(
  51 10 08 00 00 01 00 00 00 00 00 00
);

$got = unpack_record( $chart->_store_ai( @values ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_ai() method.
#
$caption = " \tChart: _store_ai()";

@values = ( 1, 2, 0, pack 'H*', '3B00000000070000000000' );

$expected = join ' ', qw(
  51 10 13 00 01 02 00 00 00 00 0B 00 3B 00 00 00
  00 07 00 00 00 00 00
);

$got = unpack_record( $chart->_store_ai( @values ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_dataformat() method.
#
$caption = " \tChart: _store_dataformat()";

$expected = join ' ', qw(
  06 10 08 00 FF FF 00 00 00 00 00 00
);

$got = unpack_record( $chart->_store_dataformat( 0 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_3dbarshape() method.
#
$caption = " \tChart: _store_3dbarshape()";

$expected = join ' ', qw(
  5F 10 02 00 00 00
);

$got = unpack_record( $chart->_store_3dbarshape() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_sertocrt() method.
#
$caption = " \tChart: _store_sertocrt()";

$expected = join ' ', qw(
  45 10 02 00 00 00
);

$got = unpack_record( $chart->_store_sertocrt() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_shtprops() method.
#
$caption = " \tChart: _store_shtprops()";

$expected = join ' ', qw(
  44 10 04 00 0E 00 00 00
);

$got = unpack_record( $chart->_store_shtprops() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_defaulttext() method.
#
$caption = " \tChart: _store_defaulttext()";

$expected = join ' ', qw(
  24 10 02 00 02 00
);

$got = unpack_record( $chart->_store_defaulttext() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_charttext() method.
#
$caption = " \tChart: _store_charttext()";

$expected = join ' ', qw(
  25 10 20 00 02 02 01 00 00 00 00 00 46 FF FF FF
  06 FF FF FF 00 00 00 00 00 00 00 00 B1 00 4D 00
  00 00 00 00
);

$got = unpack_record( $chart->_store_charttext() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_fontx() method.
#
$caption = " \tChart: _store_fontx()";

$expected = join ' ', qw(
  26 10 02 00 05 00
);

$got = unpack_record( $chart->_store_fontx( 5 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_axesused() method.
#
$caption = " \tChart: _store_axesused()";

$expected = join ' ', qw(
  46 10 02 00 01 00
);

$got = unpack_record( $chart->_store_axesused( 1 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_axisparent() method.
#
$caption = " \tChart: _store_axisparent()";

$expected = join ' ', qw(
  41 10 12 00 00 00 F8 00 00 00 F5 01 00 00 7F 0E
  00 00 36 0B 00 00
);

$got = unpack_record( $chart->_store_axisparent( 0 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_axis() method.
#
$caption = " \tChart: _store_axis()";

$expected = join ' ', qw(
  1D 10 12 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00
);

$got = unpack_record( $chart->_store_axis( 0 ) );

is( $got, $expected, $caption );

###############################################################################
#
# Test the _store_catserrange() method.
#
$caption = " \tChart: _store_catserrange()";

$expected = join ' ', qw(
  20 10 08 00 01 00 01 00 01 00 01 00
);

$got = unpack_record( $chart->_store_catserrange() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_axcext() method.
#
$caption = " \tChart: _store_axcext()";

$expected = join ' ', qw(
  62 10 12 00 00 00 00 00 01 00 00 00 01 00 00 00
  00 00 00 00 EF 00
);

$got = unpack_record( $chart->_store_axcext() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_tick() method.
#
$caption = " \tChart: _store_tick()";

$expected = join ' ', qw(
  1E 10 1E 00 02 00 03 01 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 23 00 4D 00
  00 00
);

$got = unpack_record( $chart->_store_tick() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_valuerange() method.
#
$caption = " \tChart: _store_valuerange()";

$expected = join ' ', qw(
  1F 10 2A 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 1F 01
);

$got = unpack_record( $chart->_store_valuerange() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_axislineformat() method.
#
$caption = " \tChart: _store_axislineformat()";

$expected = join ' ', qw(
  21 10 02 00 01 00
);

$got = unpack_record( $chart->_store_axislineformat() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_lineformat() method.
#
$caption = " \tChart: _store_lineformat()";

$expected = join ' ', qw(
  07 10 0C 00 00 00 00 00 00 00 FF FF 09 00 4D 00
);

$got = unpack_record( $chart->_store_lineformat() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_frame() method.
#
$caption = " \tChart: _store_frame()";

$expected = join ' ', qw(
  32 10 04 00 00 00 03 00
);

$got = unpack_record( $chart->_store_frame() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_areaformat() method.
#
$caption = " \tChart: _store_areaformat()";

$expected = join ' ', qw(
  0A 10 10 00 C0 C0 C0 00 00 00 00 00 01 00 00 00
  16 00 4F 00
);

$got = unpack_record( $chart->_store_areaformat() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_chartformat() method.
#
$caption = " \tChart: _store_chartformat()";

$expected = join ' ', qw(
  14 10 14 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00
);

$got = unpack_record( $chart->_store_chartformat() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_bar() method.
#
$caption = " \tChart: _store_bar()";

$expected = join ' ', qw(
  17 10 06 00 00 00 96 00 00 00
);

$got = unpack_record( $chart->_store_bar() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_legend() method.
#
$caption = " \tChart: _store_legend()";

$expected = join ' ', qw(
  15 10 14 00 F9 05 00 00 E9 0E 00 00 7D 04 00 00
  9C 00 00 00 00 01 0F 00
);

$got = unpack_record( $chart->_store_legend() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_pos() method.
#
$caption = " \tChart: _store_pos()";

$expected = join ' ', qw(
  4F 10 14 00 05 00 02 00 83 0E 00 00 F9 06 00 00
  00 00 00 00 00 00 00 00
);

@values = ( 5, 2, 0x0E83, 0x06F9, 0, 0 );

$got = unpack_record( $chart->_store_pos( @values ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_text() method.
#
$caption = " \tChart: _store_text()";

$expected = join ' ', qw(

  25 10 20 00 02 02 01 00 00 00 00 00 46 FF FF FF
  06 FF FF FF 00 00 00 00 00 00 00 00 B1 00 4D 00
  20 10 00 00
);

@values = ( 0xFFFFFF46, 0xFFFFFF06, 0, 0, 0x00B1, 0x1020 );

$got = unpack_record( $chart->_store_text( @values ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_plotgrowth() method.
#
$caption = " \tChart: _store_plotgrowth()";

$expected = join ' ', qw(
  64 10 08 00 00 00 01 00 00 00 01 00
);

$got = unpack_record( $chart->_store_plotgrowth() );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_seriestext() method.
#
$caption = " \tChart: _store_seriestext()";

$expected = join ' ', qw(
  0D 10 14 00 00 00 10 00 4E 61 6D 65
  20 66 6F 72 20 53 65 72
  69 65 73 31
);

$string = 'Name for Series1';

$got = unpack_record( $chart->_store_seriestext( $string, 0 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_seriestext() method. UTF-16 string.
#
$caption = " \tChart: _store_seriestext()";

$expected = join ' ', qw(
  0D 10 24 00 00 00 10 01 4E 00 61 00 6D 00 65 00
  20 00 66 00 6F 00 72 00 20 00 53 00 65 00 72 00
  69 00 65 00 73 00 31 00
);

$string = pack 'n*', unpack 'C*', 'Name for Series1';

$got = unpack_record( $chart->_store_seriestext( $string, 1 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Test the _store_objectlink() method.
#
$caption = " \tChart: _store_objectlink()";

$expected = join ' ', qw(
    27 10 06 00 01 00 00 00 00 00
);

$got = unpack_record( $chart->_store_objectlink( 1 ) );

is( $got, $expected, $caption );


###############################################################################
#
# Utility function used by the test suite.
#
# Unpack the binary data into a format suitable for printing in tests.
#
sub unpack_record {
    return join ' ', map { sprintf '%02X', $_ } unpack 'C*', shift;
}


__END__
