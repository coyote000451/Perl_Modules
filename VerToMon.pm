use warnings;
use strict;
use diagnostics;

package VerToMon;

	sub new
	{
		my $class = shift;
		my $getVersion = {
			_version => shift,
	
			};
		bless $getVersion, $class;
		return $getVersion;
	}

	sub getMonth
	{
		my $self = shift; # shift @_
	
		my $version 	= $self->{_version};
		my $count = 0;
		my $watch; # watchdog timer
		
	for ($watch = 0; $watch < 12; $watch++)
	{
		
		if ($version > "195")
		{
			while ($version != 195)
			{
				$version = $version - 1;	
				$count++;
				print "COUNT:  $count\n";
				#sleep(1);
			}
		}
	
		elsif ($version < "195")
		{
			while ($version != 195)
			{
				$version = $version + 1;
				$count++;
			}
			
			$count = 12 - $count;
		}
	}
	
	my @month = qw(January February March April May June July August September October November December);
	my $month = $month[$count]; # Find the array element to return
	print "WATCH: $watch\n";
	
	return($month);
	
	}
	
	sub getPrevMonth
	{
		my $self = shift; # shift @_
	
		my $version 	= $self->{_version};
		my $count = 0;
		my $watch; # watchdog timer
		
	for ($watch = 0; $watch < 12; $watch++)
	{
		
		if ($version > "195")
		{
			while ($version != 195)
			{
				$version = $version - 1;	
				$count++;
				print "COUNT:  $count\n";
				#sleep(1);
			}
		}
	
		elsif ($version < "195")
		{
			while ($version != 195)
			{
				$version = $version + 1;
				$count++;
			}
		}
	}
	
	my @month = qw(January February March April May June July August September October November December);
	my $month = $month[$count-1]; # Find the array element to return
	print "WATCH: $watch\n";
	
	return($month);
	
	}
	
	sub getTruncMonth
	{
		my $self = shift; # shift @_
	
		my $version 	= $self->{_version};
		my $count = 0;
		my $watch; # watchdog timer
		
	for ($watch = 0; $watch < 12; $watch++)
	{
		
		if ($version > "195")
		{
			while ($version != 195)
			{
				$version = $version - 1;	
				$count++;
				print "COUNT:  $count\n";
				#sleep(1);
			}
		}
	
		elsif ($version < "195")
		{
			while ($version != 195)
			{
				$version = $version + 1;
				$count++;
			}
		}
	}
	
	my @month = qw(Jan Feb March Apr May Jun Jul Aug Sep Oct Nov Dec);
	my $month = $month[$count]; # Find the array element to return
	print "WATCH: $watch\n";
	
	return($month);
	
	}
	
	sub getTruncMonthPrev
	{
		my $self = shift; # shift @_
	
		my $version 	= $self->{_version};
		my $count = 0;
		my $watch; # watchdog timer
		
	for ($watch = 0; $watch < 12; $watch++)
	{
		
		if ($version > "195")
		{
			while ($version != 195)
			{
				$version = $version - 1;	
				$count++;
				print "COUNT:  $count\n";
				#sleep(1);
			}
		}
	
		elsif ($version < "195")
		{
			while ($version != 195)
			{
				$version = $version + 1;
				$count++;
			}
		}
	}
	
	my @month = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
	my $month = $month[$count-1]; # Find the array element to return
	print "VerToMon:  WATCH: $watch\n";
	
	return($month);
	
	}
	1;