use warnings;
use strict;
use diagnostics;

package CultureConvert;

sub new
{
	my $class = shift;

	my $getCulture = {
		_culture => shift,
		};

	bless $getCulture, $class;
	return $getCulture;
}

sub getCulture
{
	my $self = shift; # shift @_

	my $culture = $self->{_culture};

	if ($culture =~ m/en\-US/i)
	{
		$culture = "United States";
	}

	elsif ($culture =~ m/en\-CA/i)
	{
		$culture = "Canada";
	}

	elsif ($culture =~ m/es\-CL/i)
	{
		$culture = "Chile";
	}
	
	elsif ($culture =~ m/es\-ES/i)
	{
		$culture = "Spain";
	}
	
	elsif ($culture =~ m/pt\-BR/i)
	{
		$culture = "Brazil";
	}

	elsif ($culture =~ m/en\-MY/i)
	{
		$culture = "Malaysia";
	}
	
	elsif ($culture =~ m/es\-MX/i)
	{
		$culture = "Mexico";
	}

	elsif ($culture =~ m/en\-AU/i)
	{
		$culture = "Australia";
	}

return ($culture);

}


1;
