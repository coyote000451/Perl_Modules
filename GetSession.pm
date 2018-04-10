################################################################################
# This simple class returns a session Id from PSEXEC which is used in order
# to determine what the ID is in order to login.
################################################################################
# Created 1/22/14
################################################################################
# Updates:
# 
################################################################################
# It is instantiated as:  
# ! c:\perl\bin\perl
#
# use warnings;
# use diagnostics;
# use GetSession;
#
# $host = "\\mulqa2k-ca";
# $userid = "ts023443";
# $SesObj = GetSession->new($host, $userid);
# $Return = $SesObj->Session();
#
# print "RETURN:  $Return\n";
################################################################################

package GetSession;

sub new
{
# pass in a userid so as to get back one line
	my $class = shift; # shift @_
	my $getSess = {
		_host   => shift,
		_userid => shift,
		};
	
	bless $getSess, $class;
	return $getSess;
}
	
sub Session
{
	my $self = shift;
	my $HOST = $self->{_host};
	my $USERID = $self->{_userid};
	my $command = "psexec.exe"." "."\\\\".$HOST." "."query"." "."session"." "." ".$USERID." > session.$HOST";
	system("$command");
		
	# open up the file parse it with read file

	use ReadFile;
	$file = ReadFile->new(".\\session.$HOST");
	@FileArray = $file->GetFile();
	@AArray=(); # make sure array is clear
	@BArray=(); # make sure array is clear otherwise you will get the previous session and be fooled
	
	for $files (@FileArray)
	{
		@AArray = split(/ /,$files);
	}

	foreach $one (@AArray)
	{
		if ($one !~ m/^\s*$/) # this removes all of the blank lines
		{
			push (@BArray, $one);
			print "SESSION:  $one\n";
 		}
 		@tempArray = @BArray;
	}
	print "SESSION RETURNED BACK:  $BArray[2]\n";
	
	return ($BArray[2]);
	unlink("session.out");
	

}

sub User
{	
	my $self = shift;
	my $HOST = $self->{_host};
	my $USERID = $self->{_userid};
	my $command = "psexec.exe"." "."\\\\".$HOST." "."query"." "."session"." "." ".$USERID." > session.$HOST";
	system("$command");
		
	# open up the file parse it with read file

	use ReadFile;
	$file1 = ReadFile->new(".\\session.$HOST");
	@FileArray1 = $file1->GetFile();

	for $files1 (@FileArray1)
	{
	#print "$files1\n";
	@AArray1 = split(/ /,$files1);
	}

	for $one1 (@AArray1)
	{
		if ($one1 !~ m/^\s*$/) # this removes all of the blank lines
		{
			push (@BArray1, $one1);

		}
	}

	print "USER ID RETURNED BACK:  $BArray1[1]\n";
	return ($BArray1[1]);
	unlink("session.out");
}
1;