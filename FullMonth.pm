use warnings;
use strict;
use diagnostics;

package FullMonth;

sub new
{
	my $class = shift;

	my $getMonth = {
		_month => shift,
		};

	bless $getMonth, $class;
	return $getMonth;
}

sub transformMonth
{
	my $self = shift; # shift @_

	my $month = $self->{_month};

	if ($month =~ m/Jan/i)
	{
		$month = "January";
	}

	elsif ($month =~ m/Feb/i)
	{
		$month = "February";
	}

	elsif ($month =~ m/Mar/i)
	{
		$month = "March";
	}
	
	elsif ($month =~ m/Apr/i)
	{
		$month = "April";
	}
	
	elsif ($month =~ m/May/i)
	{
		$month = "May";
	}

	elsif ($month =~ m/Jun/i)
	{
		$month = "June";
	}
	
	elsif ($month =~ m/Jul/i)
	{
		$month = "July";
	}

	elsif ($month =~ m/Aug/i)
	{
		$month = "August";
	}
	
	elsif ($month =~ m/Sep/i)
	{
		$month = "September";
	}
	
		elsif ($month =~ m/Oct/i)
	{
		$month = "October";
	}
	
		elsif ($month =~ m/Nov/i)
	{
		$month = "November";
	}
	
		elsif ($month =~ m/Dec/i)
	{
		$month = "December";
	}
	
	
return ($month);

}


1;
