################################################################################
# This simple class just takes passed in directory path\file reads the file 
# contents an into # an array and returns the array
################################################################################
# Created 5/6/14
################################################################################
# Updates:
# 
################################################################################
# It is instantiated as:  
# #! c:\perl\bin\perl
# use warnings;
# use diagnostics;
# use ReadFile;
#
# $file = ReadFile->new("c:\\temp\\CheckMate.txt");
# @FileArray = $file->GetFile();
#
# for $files (@FileArray)
# {
#	print "$files\n";
# }
#
################################################################################

package Log;

sub new

{

	my $class = shift; # shift @_
	my $Log = {

		_handle => shift,
		_file   => shift,

	};
	
	bless $Log, $class;
	return $Log;
}
	
sub Log
{
	my $self   = shift;
	my $Msg    = $self->{_msg};
	
	# open up a file for appending/writing
	#open "$Handle", ">>", "$File" or die $!;
	open $Handle, ">>", $File;
	print $Handle $Msg;

}


1;