use warnings;
use diagnostics;

package FileMove;

sub new
{
	my $class = shift;
	my $moveFile = {
		_source => shift,
		_node   => shift,
		};
	bless $moveFile, $class;
	return $moveFile;

}

sub moveFiles
{
	my $self = shift;
	my $Source = $self->{_source};
	my $Node = $self->{_node};

	print "Source directory is:  $Source\n";
	print "Node destination is:  $Node\n";

	# Very important allows quotes into xcopy command
	my $SourceMove = "\"$Source\"";	
	my $moveFile="move"." "."/Y"." "."$SourceMove"." ".$Node; #works
	printf "FileMove.pm MOVE:  $moveFile\n";

	#system("$copyInstall") or die "$!";
	system("$moveFile");
}

1;