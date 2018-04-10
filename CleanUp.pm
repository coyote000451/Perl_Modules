
use warnings;
use diagnostics;

############################################################################################################
# This object CleanUp.pm will remotely login to a machine taking userid, node and file name(s) as arguments
# Date:  1/28/14
############################################################################################################
#
# Updates:
#
#
############################################################################################################


package CleanUp;
	
sub new
{
# pass in userid, node and file name

	my $class = shift; # shift @_
	my $get = {
		_host   => shift,
		_userid => shift,
		_session => shift,
		_file	=> shift,
		};
	
	bless $get, $class;
	return $get;
}

sub dfile
{
	my $self 	= shift;
	my $HOST 	= $self->{_host};
	my $USERID 	= $self->{_userid};
	my $SESSION = $self->{_session};
	my $FILE	= $self->{_file};
	
	my $command = "psexec.exe"." "."\\\\".$HOST." "."query"." "."session"." "." ".$USERID." > session.$HOST";
	system("$command");
	
	
}