use warnings;


package SetENV;


sub new
{

	my $class = shift;
	my $setE = {
		_ssdir    	=> shift,
		_sspath   	=> shift,
		_ssfiles 	=> shift,
		_ssfiletar 	=> shift,
		_version 	=> shift,
		_dspver		=> shift,
		};
	bless $setE, $class;
	return $setE;
}

sub SetPath
{
	my $self		= shift;
	my $ssdir		= $self->{_ssdir};
	my $sspath		= $self->{_sspath};
	my $ssfiles   	= $self->{_ssfiles};
	my $sstarget  	= $self->{_ssfiletar};
	my $version  	= $self->{_version};
	my $dspver		= $self->{_dspver};

	if (-e "SDKv4.bat")
	{
	unlink ("SDKv4.bat");
	}

     	open FILE, ">>", "SDKv4.bat" or die $!;
        print FILE "set SSDIR=$ssdir\n";
	    print FILE "set $sspath\n";
	     #print FILE "ss.exe"." "."GET"." "."\""."\$"."/"."Multum"." "."Production"." "."Software"."\\SDK4\\DSP"." "."v$dspver"."\\bin"."\""." "."-GF"." "."-W-"." "."-GL"."\"c:\\SDK_Build\\v$version\"";
	     #print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"."\"$sstarget"." "."-R"; 
	     #print FILE "ss.exe"." "."GET"." "."\""."$ssfiles"." "."-R"." "."-GF"." "."-W-"." "."-GL"." "."\"$sstarget"; #almost
	     #print FILE "ss.exe"." "."GET"." "."\""."$ssfiles".\"." "."-R"." "."-GF"." "."-W-"." "."-GL"." "."\"$sstarget"; 
	     #print FILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"."\"$sstarget"; 
	     #print FILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-I"." "."-Y"." "."-GF"." "."-W-"." "."-Q"." "."-GL"."\"$sstarget"; 
	    print FILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-I"."-Y"." "."-GF"." "."-W-"." "."-Q"." "."-GL"."\"$sstarget"; 
	    print FILE "\n";
	    print FILE "exit\n";
		close (FILE);

}

sub GetWeb
{
	my $self	= shift;
	my $ssdir	= $self->{_ssdir};
	my $sspath	= $self->{_sspath};
	my $ssfiles   	= $self->{_ssfiles};
	my $sstarget  	= $self->{_ssfiletar};
	my $version  	= $self->{_version};
	my $dspver	= $self->{_dspver};

	if (-e "SDKWebv4.bat")
	{
	unlink ("SDKWebv4.bat");
	}

     	open GFILE, ">>", "SDKWebv4.bat" or die $!;

             print GFILE "set SSDIR=$ssdir\n";
	     print GFILE "set $sspath\n";
	     #print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"." "."\""."$sstarget";
	     #print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"."\"$sstarget"; #this works just not recursively
	     #print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"."."-R".\"$sstarget";
 	     #print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-GF"." "."-W-"." "."-GL"."\"$sstarget"; 
 	     print GFILE "ss.exe"." "."GET"." "."\""."$ssfiles"."\""." "."-I"."-Y"." "."-GF"." "."-W-"." "."-Q"." "."-GL"."\"$sstarget";
	     print GFILE "\n";
	     print GFILE "exit\n";
	close (GFILE);


}

sub LaunchSSBin
{
	system("cmd.exe /k SDKv4.bat");
}

sub LaunchSSWeb
{
	system("cmd.exe /k SDKWebv4.bat");
}
1;