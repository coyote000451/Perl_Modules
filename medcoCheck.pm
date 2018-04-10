#! c:\perl\bin
use warnings;
use diagnostics;
use ReadDir;
$count = 0;
$test = 0;

#
# This checks from 2 pages of leaflets
#

 
 $DIR_PATH = "\\\\bluffton\\ProductionReleases\\Medco\\v199_May14\\QA#1_0326\\TIFF-sheet";
 $TOP_DIR = ReadDir->new($DIR_PATH);
 @DirArray = $TOP_DIR->Directory();
 @DirArray = [11.tif 12.tif 21.tif];

 for $file (@DirArray) 
 {

	$file =~ s/.tif//g;

	    if ($test eq "0")
		{
			$one = $file;
			$test = 1;

		}
	     else
		{
			$two = $file;
			$test = 0;

		}

	if ($test eq "0")
	{	
	 	$check = $one + 1;


		if (($check =~ m/$two/) || ($two =~ m/$check/))

		{
			# print "$one and $two are related\n";
			# concatenate $one and $two;
			# push (@array, xx);
		}

		else
		{

			print "CHECK:  $one does not have a match\n";
			$test = 1;
			$one = $two;
;		}
	}
	$count = $count+1;
 }

print "COUNT:  $count\n";