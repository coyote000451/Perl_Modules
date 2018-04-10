use warnings;
use strict;
use diagnostics;
use CultureConvert;
use ReadDir;
use CopyTar;

package FindDrugNames;

sub new
{
	my $class = shift;
	my $getReports = {
		_culture 		=> shift,
		_subculture 	=> shift,
		_version 		=> shift,
		_period  		=> shift,
		_year    		=> shift,
		_zip	 		=> shift,
		_source	 		=> shift,
		_target	 		=> shift,
		};
	bless $getReports, $class;
	return $getReports;
}

sub copyReports
{
	my $self = shift; # shift @_

	my $culture 	= $self->{_culture};
	my $subculture 	= $self->{_subculture};
	my $version 	= $self->{_version};
	my $period  	= $self->{_period};
	my $year    	= $self->{_year};
	my $zip     	= $self->{_zip};
	my $source  	= $self->{_source}; # \\ada\1-qa\QA-Approved Releases
	my $target  	= $self->{_target};