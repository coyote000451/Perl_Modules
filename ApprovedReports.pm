use warnings;
use strict;
use diagnostics;
use CultureConvert;
use ReadDir;
use CopyTar;

package ApprovedReports;

sub new
{
	my $class = shift;
	my $getReports = {
		_culture 	=> shift,
		_subculture 	=> shift,
		_version 	=> shift,
		_period  	=> shift,
		_year    	=> shift,
		_zip	 	=> shift,
		_source	 	=> shift,
		_target	 	=> shift,
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

# Convert the Culture

#
# Set the culture abbreviation
#
my $SubCul = $subculture;

#
# Convert the xx-XX culture to full name
#
my $Convert = CultureConvert->new($culture)->getCulture();

#
# Determine the source directory path:
#
my $Directory;

	if (($culture =~ m/en\-US/i) || ($culture =~ m/en\-CA/i) || ($culture =~ m/en\-CERN/i))


	{
		if ($culture =~ m/en-CA/i)
		{
			$SubCul = "CA";
		}

		$Directory = "\\".$source."\\".$Convert." ".$culture."\\".$year." Releases"."\\"."v$version"."\\"."Update Reports $SubCul";
	}

	else
	{
		if ($culture =~ m/en-AU/i)
		{
			$SubCul = "AU";
		}

		$Directory = "\\".$source."\\".$Convert." ".$culture."\\".$year."\\"."v$version"."\\"."Update Reports $SubCul";

	}	

print "DIRECTORY:  $Directory\n"; 

#
# Get the contents of the updated reports
#
use VerToMon;

my $subversion = $version; # preserve the version

######################################################################################################################
# Creating the US update reports structure                                                                           #
######################################################################################################################

	if (($culture =~ m/en\-US/i) || ($culture =~ m/en\-CA/i) || ($culture =~ m/en\-CERN/i))
	{
		my $check = 0;
		
		for (my $count = 0; $count < $period; $count++)
		{
	
			$version = $subversion; # preserve the version as its critical to the counter below

	
			
			$version = $version - $count;
			my $month;
			$month = VerToMon->new($version)->getMonth();
			$Directory =~ s/v[0-9][0-9][0-9]/v$version/;			
			
				if (($version < 195) && ($check != 1))
					{
						my $curYear = $year;
						$year = $year -1;
						$Directory =~ s/$curYear/$year/;
						print "EARLY Directory:  $Directory\n";
						$check = 1;
							
					}															
			
			print "Directory pass to ReadDir:  $Directory\n";
	
			my @DirArray1 = ReadDir->new($Directory)->Directory(); 
	
			for my $file (@DirArray1)
			{	
					# If the directory that doesn't exist create it
					if (!-d "$target\\v$version $month $year")
					{
						
						#if ($version < 195)
						#	{
						#		my $curYear = $year;
						#		$year = $year -1;
						#		$Directory =~ s/curYear/$year/;
						#		print "EARLY Directory:  $Directory\n";
						#		#exit;
						#		
						#	}						
						
						mkdir "$target";
						mkdir "$target\\v$version $month $year";
						
						print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
						print "US Directory creation:  $target\\v$version $month $year\n";
						print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
								sleep (2);
					}
					
				CopyTar->new("$Directory\\$file","$target\\v$version $month $year")->copyFilesRec(); # need change the $target
			}
		} # For loop counter
	}

######################################################################################################################
# Creating the UK update reports structure                                                                           #
######################################################################################################################
	
	if (($culture =~ m/en\-AU/i) || ($culture =~ m/en\-MY/i) || ($culture =~ m/es\-CL/i) || ($culture =~ m/es\-ES/i) || ($culture =~ m/es\-MX/i))
	{
		my $check = 0; # this in place to make sure we don't continually decrement the year everytime thru the loop		
		my $verCount = "0";
		
		for (my $count = 0; $count < $period; $count++)
		{
	
			$version = $subversion; # preserve the version as its critical to the counter below

			$version = $version - $verCount;
			my $month;
			$month = VerToMon->new($version)->getMonth();
			$Directory =~ s/v[0-9][0-9][0-9]/v$version/;
			
					if (($version < 195) && ($check != 1))
					{
						my $curYear = $year;
						$year = $year -1;
						$Directory =~ s/$curYear/$year/;
						print "EARLY Directory:  $Directory\n";
						$check = 1;							
					}			
					
	print "DIRECTORY ApprovedReports:  $Directory\n";
			my @DirArray1 = ReadDir->new($Directory)->Directory(); 
			$verCount = $verCount + 3;
	
			for my $file (@DirArray1)
			{	
					# If the directory that doesn't exist create it
					if (!-d "$target\\Update Reports $SubCul v$version $month $year")
					{						
						mkdir "$target";
						mkdir "$target\\Update Reports $SubCul v$version $month $year";
						print "Made the directory:  $target\n";
					}				
					
				CopyTar->new("$Directory\\$file","$target\\Update Reports $SubCul v$version $month $year")->copyFilesRec(); # need change the $target This will need to be updated for UK

			}
		} # For loop counter
	}
}


1;
		