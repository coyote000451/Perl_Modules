#! c:\perl\bin
use diagnostics;
use Win32::OLE;
use Spreadsheet::ParseExcel;  

package ProcPregExcel;

sub ProcPregExcel 
{
   $workbook  = $_[0];
   $outfile   = $_[1];

   my $parser   = Spreadsheet::ParseExcel->new(); 
   my $workbook = $parser->Parse('\\\\ada\\1-qa\\QA-Approved Releases\\Australia en-AU\\2012\\v180\\Update Reports AU\\en-AU_Jul12_to_Oct12_Pregnancy_Text_Changes_Multum_Text.xls');  

printf $outfile;
printf "\n";
printf $workbook;

    if ( !defined $workbook ) 
    {
        die "Got error code ", $parser->error_code, ".\n";
	return $parser->error_code;
    }

open FILE, ">>", "$outfile" or die $!;

for my $worksheet ( $workbook->worksheets() ) {
     my ( $row_min, $row_max ) = $worksheet->row_range();
     my ( $col_min, $col_max ) = $worksheet->col_range();      

printf "$row_min, $row_max\n";
printf "$col_min, $col_max\n";

#####################################################
# Routine which takes the spreadsheet and reorientes the columns
# and creates a new file *.xls

     for my $row ( $row_min + 1 .. $row_max ) {
      $Change = $worksheet->get_cell( $row, $col_min );
      if ($Change->value() eq "New Text Block")
      {


           for my $col ($col_min) 
	{
             	$Change = $worksheet->get_cell( $row, $col_min );

	}

           for my $col ($col_min + 3) 
	{
             	$NewLevelId = $worksheet->get_cell( $row, $col_min + 3 );

			if (!defined $NewLevelId)
			{
				#print FILE "NULL", "|";
			}
			else
			{
            			print FILE $NewLevelId->value(), "|";
			}

             	
	}

           for my $col ($col_min + 1) 
	{
           	$Dnum = $worksheet->get_cell( $row, $col_min + 1 );
			if (!defined $Dnum)
			{
				#print FILE "NULL", "|";
			}
			else
			{
            			print FILE $Dnum->value(), "|";
			}
             	
	}

           for my $col ($col_min + 5) 
	{
             	$NewText = $worksheet->get_cell( $row, $col_min + 5 );
			if (!defined $NewText)
			{
				#print FILE "NULL", "|";

			}
			else
			{
				chomp($NewText);
				$NewText =~ s/^\n//g;
				print FILE $NewText->value(), "|";


			# Remember dnum to check for duplicate NewText
				

			}
	}
             	
           for my $col ($col_min + 7) 
	{
             	$NewSeverity = $worksheet->get_cell( $row, $col_min + 7 );


			if (!defined $NewSeverity)
			{
				#print FILE "NULL", "|";
				#print FILE "\n";
			}
			else
			{
            			print FILE $NewSeverity->value();
				print FILE "\n";
			}

             	
	}


             print "Processing: $row \n";
}
}
}
}
close(FILE);
1;