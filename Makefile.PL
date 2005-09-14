use 5.008003;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Spreadsheet::WriteExcel::WebPivot',
    VERSION_FROM      => 'lib/Spreadsheet/WriteExcel/WebPivot.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Spreadsheet/WriteExcel/WebPivot.pm', # retrieve abstract from module
       AUTHOR         => 'Nathan Lewis <nathanlewis@local>') : ()),
);
