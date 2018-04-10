#! c:\perl\bin

use diagnostics;
use Win32::OLE;
use Spreadsheet::ParseExcel;  
use diagnostics;

package SendPregText;

sub SendPregText 
	{
	$outfile1 = $_[0];

   	my $parser   = Spreadsheet::ParseExcel->new(); 
   	my $workbook1 = $parser->Parse($outfile1);

	if ( !defined $workbook1 ) 
    	{
        die "Got error code ", $parser->error_code, ".\n";
	return $parser->error_code;
    	}

	for my $worksheet ( $workbook1->worksheets() ) {
     	my ( $row_min, $row_max ) = $worksheet->row_range();
     	my ( $col_min, $col_max ) = $worksheet->col_range();      

	printf "$row_min, $row_max\n";
	printf "$col_min, $col_max\n";

	}
}
1;