#!/usr/bin/perl -w

###############################################################################
#
# A simple demo of a Pie chart in Spreadsheet::WriteExcel.
#
# reverse('�'), December 2009, John McNamara, jmcnamara@cpan.org
#

use strict;
use Spreadsheet::WriteExcel;

my $workbook  = Spreadsheet::WriteExcel->new( 'chart_pie.xls' );
my $worksheet = $workbook->add_worksheet();
my $bold      = $workbook->add_format( bold => 1 );

# Add the data to the worksheet that the charts will refer to.
my $headings = [ 'Category', 'Values 1', 'Values 2' ];
my $data = [
    [ 2, 3, 4, 5, 6, 7 ],
    [ 1, 4, 5, 2, 1, 5 ],
    [ 3, 6, 7, 5, 4, 3 ],
];

$worksheet->write( 'A1', $headings, $bold );
$worksheet->write( 'A2', $data );


###############################################################################
#
# Example 1. A minimal chart.
#
my $chart1 = $workbook->add_chart( type => 'pie' );

# Add values only. Use the default categories.
$chart1->add_series( values => '=Sheet1!$B$2:$B$7' );


###############################################################################
#
# Example 2. A minimal chart with user specified categories (X axis)
#            and a series name.
#
my $chart2 = $workbook->add_chart( type => 'pie' );

# Configure the series.
$chart2->add_series(
    categories => '=Sheet1!$A$2:$A$7',
    values     => '=Sheet1!$B$2:$B$7',
    name       => 'Test data series 1',
);


###############################################################################
#
# Example 3. Same as previous chart but with added title.
#
my $chart3 = $workbook->add_chart( type => 'pie' );

# Configure the series.
$chart3->add_series(
    categories => '=Sheet1!$A$2:$A$7',
    values     => '=Sheet1!$B$2:$B$7',
    name       => 'Test data series 1',
);

# Add some labels.
$chart3->set_title( name => 'Results of sample analysis' );

# Note, a Pie chart doesn't have an X or Y axis so the following methods
# used in the other chart_*.pl examples are ignored.
# $chart3->set_x_axis( name => 'Sample number' );
# $chart3->set_y_axis( name => 'Sample length (cm)' );


###############################################################################
#
# Example 4. Same as previous chart but with an added series and with a
#            user specified chart sheet name.
#
my $chart4 = $workbook->add_chart( name => 'Results Chart', type => 'pie' );

# Configure the series.
$chart4->add_series(
    categories => '=Sheet1!$A$2:$A$7',
    values     => '=Sheet1!$B$2:$B$7',
    name       => 'Test data series 1',
);

# Add another series.
$chart4->add_series(
    categories => '=Sheet1!$A$2:$A$7',
    values     => '=Sheet1!$C$2:$C$7',
    name       => 'Test data series 2',
);

# Add some labels.
$chart4->set_title( name => 'Results of sample analysis' );


###############################################################################
#
# Example 5. Same as Example 3 but as an embedded chart.
#
my $chart5 = $workbook->add_chart( type => 'pie', embedded => 1 );

# Configure the series.
$chart5->add_series(
    categories => '=Sheet1!$A$2:$A$7',
    values     => '=Sheet1!$B$2:$B$7',
    name       => 'Test data series 1',
);

# Add some labels.
$chart5->set_title( name => 'Results of sample analysis' );

# Insert the chart into the main worksheet.
$worksheet->insert_chart( 'E2', $chart5 );

__END__

