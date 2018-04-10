#! c:\perl\bin

use warnings;
use diagnostics;
use File::Copy;
use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);

# Set up constants
$MACHINE 	= 	"gmfileshare01\\multum-production";




# Set up inputs

# Need to know the version
$VERSION	= 	$ARGV[0];
	if (!$VERSION)
	{
		printf "Version:  188, 189 190...";
		exit;
	}

# Need to know the culture
#$CULTURE	= 	$ARGV[1];
#	if (!$CULTURE)
#	{
#	printf "Culture:  en-US, en-CA...";
#	exit;
#	}	

# Does the source directory exist?

#$SRCDIR = "\\\\$MACHINE\\Multum_SDK_Internal\\Commands$VERSION\\PDMS\\$CULTURE";
$SRCDIR = "\\\\$MACHINE\\ProdLeaflets\\Leaflets_v$VERSION";

sleep(2);
	if (!-d $SRCDIR)
	{
		printf "Source Directory Doesn't exist";
		printf "SRCDIR:  $SRCDIR\n";
		exit;
	}

# Find the MIT files
#system("dir \\\\$MACHINE\\Multum_SDK_Internal\\Commands$VERSION\\PDMS\\$CULTURE\\*MIT*");
#system("dir $SRCDIR\\*MIT*");

# Does the target directory exist, if not create it

#\\ada\1-qa\QA-Releases\SDK_MIT Files\v186

# Reformat $CULTURE
$CULTURE =~ s/en-//g;
##$CULTURE =~ s/es-//g;

#$TARDIR = "\\\\ada\\1-qa\\QA-Releases\\SDK_MIT_Files\\v$VERSION\\$CULTURE";
$TARDIR = "\\\\IPMULQA2K12R2-4\\c\\temp\\Leaflets_v$VERSION";
print "Target Dir:  $TARDIR\n";

	if (!-d $TARDIR)
	{
		printf "Target Directory Doesn't exist\n";
		system("mkdir $TARDIR");
	}

#print "Source Dir:  $SRCDIR\n";
opendir(DIR, $SRCDIR) or die "Can't open $SRCDIR: $!";
my @dirDir = readdir DIR;

shift(@dirDir); #removes . from array
shift(@dirDir); #removes .. from array

foreach my $dir (@dirDir)
{

	print "DIR: $dir\n";
	print "SRCDIR: $SRCDIR\\$dir";


	if (!-d "$TARDIR\\$dir")
	{
		printf "$TARDIR\\$dir target Directory Doesn't exist\n";
		system("mkdir $TARDIR\\$dir");
	}


   	if(-d "$SRCDIR\\$dir") 
	{
 		
		opendir(LeafSubDir, "$SRCDIR\\$dir") or die "Can't open $SRCDIR\\$dir: $!";
		my @fileDir = readdir LeafSubDir;

		#foreach $test (@fileDir)
		#{
		#	print "FILES:  $test\n";
		#}
		#exit;

		shift(@fileDir);
		shift(@fileDir);
			foreach my $name (@fileDir)
			{
				print "$SRCDIR\\$dir\\$name\n";	
				print "$TARDIR\\$dir\\$name\n";				
				rcopy("$SRCDIR\\$dir\\$name", "$TARDIR\\$dir\\$name") or die "Failed to copy $name: $!\n";

			}
	}
}
close(DIR);

# Copy from MIT source directory
# Copy to target directory
printf "Here is SRCDIR:  $SRCDIR\n";
printf "Here is TARDIR:  $TARDIR\n";
