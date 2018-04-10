#! c:\perl\bin\perl

use diagnostics;
use warnings;


package TarDist;

sub new
{

	my $class = shift;
	my $getIni = {
		_version => shift,
		_culture => shift,
		_target  => shfit,
	};

	print "Version is: $getIni->{_version}\n";
	print "Culture is: $getIni->{_culture}\n";
	print "Target  is: $getIni->{_target}\n";

	bless $getIni, $class;
	return $getIni;
}