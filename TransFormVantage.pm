use warnings;
use strict;
use diagnostics;

package TransFormVantage;

sub new
{
	my $class = shift;

	my $getVantage = {
		_culture => shift,
		_version => shift,
		_month 	 => shift,
		_year	 => shift,
		_vantage => shift,
		};

	bless $getVantage, $class;
	return $getVantage;
}

sub transform
{
	my $self = shift; # shift @_

	my $culture		= $self->{_culture};
	my $version		= $self->{_version};
	my $month		= $self->{_month};
	my $year		= $self->{_year};
	my $vantage		= $self->{_vantage};
	my $SUBCUL		= $culture;
	
	$SUBCUL			=~ s/\w\w\-//;
	
	my $TrunVantage	= $vantage;

	if ($culture =~ m/en\-US/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/$SUBCUL//i;
		$TrunVantage =~ s/\_$version//;
		print "TransFormVantage: $TrunVantage\n";
	}

	elsif ($culture =~ m/en\-CA/i)
	{
		$TrunVantage =~ s/$SUBCUL\_v$version//; # seems to work though not correct syntax
	}

	elsif ($culture =~ m/es\-CL/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/\_v$version//i;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";
	}
	
	elsif ($culture =~ m/es\-ES/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/\_v$version//i;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";
	}
	
	elsif ($culture =~ m/pt\-BR/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/\_v$version//i;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";
	}

	elsif ($culture =~ m/en\-MY/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/en\-//;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";

	}
	
	elsif ($culture =~ m/es\-MX/i)
	{
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/\_v$version//i;
		#$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";
	}

	elsif ($culture =~ m/en\-AU/i)
	{
		
		print "TransFormVantage Month $month\n";
		print "TransFormVantage Year: $year\n";
		print "TransFormVantage Version:  $version\n";
		print "TransFormVantage Vantage:  $TrunVantage\n";
		print "TransFromVantage SUBCUL:  $SUBCUL\n";
		$TrunVantage =~ s/\_$version//;
		$TrunVantage =~ s/\.mdb/\_$month$year\.mdb/;
		print "TransFormVantage: $TrunVantage\n";

	}

return ($TrunVantage);

}


1;
