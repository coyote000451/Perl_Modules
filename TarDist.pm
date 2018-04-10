
package TarDist;

sub new
{

	my $class = shift; # shift @_
	my $getIni = {
		_version => shift,
		_culture => shift,
		_target  => shift,
		_platform => shift,
		_user => shift,
		_password => shift,
		_session  => shift,
		_release => shift,
		_targetdir => shift,
		_shortculture => shift,
		_month	=> shift,
		_year	=> shift,
	};

#	print "Version is: $getIni->{_version}\n";
#	print "Culture is: $getIni->{_culture}\n";
#	print "Target  is: $getIni->{_target}\n";

	bless $getIni, $class;
	return $getIni;
}


sub Version
{
	my $self = shift;
	return $self->{_version}

}

sub Culture
{
	my $self = shift;
	return $self->{_culture}

}
sub Target
{
	my $self = shift;
	return $self->{_target}

}
sub Platform
{
	my $self = shift;
	return $self->{_platform}

}

sub User
{
	my $self = shift;
	return $self->{_user}
}

sub Password
{
	my $self = shift;
	return $self->{_password}
}

sub Session
{
	my $self = shift;
	return $self->{_session}
}

sub Release
{
	my $self = shift;
	return $self->{_release}
}

sub TargetDir
{
	my $self = shift;
	return $self->{_targetdir}
}

sub ShortCulture
{
	my $self = shift;
	return $self->{_shortculture}
}

sub Month
{
	my $self = shift;
	return $self->{_month}
}

sub Year
{
	my $self = shift;
	return $self->{_year}
}

sub Directory
{
	my $self = shift;
	my $Version 		= $self->{_version};
	my $Culture 		= $self->{_culture};
	my $ShortCulture 	= $self->{_shortculture};
	my $Month		= $self->{_month};
	my $Year		= $self->{_year};

	#my $Directory 		= "\\\\ada\\1-qa\\QA-Releases\\SDKv4_Core-DSP External\\$Culture";
	my $Directory		= "\\\\bluffton\\ProductionReleases\\SDKv4_$ShortCulture\\v_$Version_$Month$Year";
	return $Directory;

# \\ada\1-qa\QA-Releases\SDKv4_Core-DSP External\en-CA\Multum_Package.187.en-CA.130320.1124-qa#1

}
1;