################################################################################
# This simple class just takes passed in directory path, and creates the DIR
################################################################################
# Created 3/18/14
################################################################################
# Updates:
# 
################################################################################
# It is instantiated as:  
# #! c:\perl\bin\perl
# use warnings;
# use diagnostics;
# use createDir;

# @SubDirArray = (SdkClientDownloads, SdkCommandFiles, SdkConfigurationFiles, SdkDataFiles, # SdkDictionaryFiles, SdkDocumentationFiles, SdkLicenseFiles, SdkLogFiles);
#
# for my $file (@SubDirArray) {
#	$cDir = $SRCDIR."\\"."$file\n";
#	chomp($cDir);
#	$newDir = createDir->new($cDir);
#	$newDir->Directory();
#	}
#
################################################################################

package createDir;

sub new
{

	my $class = shift; # shift @_
	my $createDir = {
		_directory => shift,
	};
	
	bless $createDir, $class;
	return $createDir;
}
	
sub Directory
{
	my $self = shift;
	my $Directory = $self->{_directory};
	my $Status;
	
	if (-e $Directory)
	{
		chomp($Directory);
		printf "$Directory exists\n";
		$Status = "$Directory exist";

	}
	else
	{
		printf "Making $Directory\n";
		system("mkdir \"$Directory\""); # added \" to account for spaces
		#mkdir '$Directory';
		$Status = "Making $Directory";
	}
	
	return($Status);
}
1;