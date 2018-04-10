use warnings;
use strict;
use diagnostics;

package Period;

sub new
{
	my $class = shift;
	my $getPeriod = {
		_culture => shift,

		};
	bless $getPeriod, $class;
	return $getPeriod;
}

sub getPeriod
{
	my $self = shift; # shift @_

	my $culture 	= $self->{_culture};
	my $period;

	if (($culture =~ m/en\-US/i) || ($culture =~ m/en\-CA/i) || ($culture =~ m/en\-CERN/i))

	{
		$period = "6";
		
	}

	if (($culture =~ m/en\-AU/i) || ($culture =~ m/en\-MY/i) || ($culture =~ m/es\-CL/i) || ($culture =~ m/es\-ES/i) || ($culture =~ m/es\-MX/i) || ($culture =~ m/pr\-BT/i))

	{
		$period = "3";
		
	}

	if ($culture =~ m/en\-GB/i)

	{
		$period = "0";
		
	}
	

return($period);

}

1;