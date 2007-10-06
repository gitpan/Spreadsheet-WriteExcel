#!/usr/bin/perl -w

##############################################################################
#
# A simple example of converting some Unicode text to an Excel file using
# Spreadsheet::WriteExcel and perl 5.8.
#
# This example generates some Greek from a file with ISO-8859-7 encoded text.
#
#
# reverse('�'), September 2004, John McNamara, jmcnamara@cpan.org
#



# Perl 5.8 or later is required for proper utf8 handling. For older perl
# versions you should use UTF16 and the write_utf16be_string() method.
# See the write_utf16be_string section of the Spreadsheet::WriteExcel docs.
#
require 5.008;

use strict;
use Spreadsheet::WriteExcel;


my $workbook  = Spreadsheet::WriteExcel->new("unicode_8859_7.xls");
my $worksheet = $workbook->add_worksheet();
   $worksheet->set_column('A:A', 50);


my $file = 'unicode_8859_7.txt';

open FH, '<:encoding(iso-8859-7)', $file  or die "Couldn't open $file: $!\n";

my $row = 0;

while (<FH>) {
    next if /^#/; # Ignore the comments in the sample file.
    chomp;
    $worksheet->write($row++, 0,  $_);
}


__END__

