use warnings;
use diagnostics;

package GetSS;


sub new
{
	my $class = shift;
	my $getP = {
		_ssdir   => shift,
		_ssexe   => shift,
		_ssfiles => shift,
		_ssfiletar => shift,
		};
	bless $getP, $class;
	return $getP;
}

sub GetFiles
{
	my $self      = shift;
	my $ssdir     = $self->{_ssdir};
	my $ssexe     = $self->{_ssexe};
	my $ssfiles   = $self->{_ssfiles};
	my $sstarget  = $self->{_ssfiletar};

print "$self\n";
print "$ssdir\n";
print "$ssexe\n";
print "$ssfiles\n";
print "$sstarget\n";

#set SSDIR = $ssdir;


#my $SS = "$ssexe\\ss.exe GET '$ssfiles' -GF -W- -GL $sstarget";
#my $SS = "C:\\\Program Files\\\Microsoft Visual SourceSafe"\\ss.exe GET $ssfiles "-GF" "-W-" "-GL" $sstarget";

#$SS = ss.exe GET "$/Multum Production Software\SDK4\DSP v196\bin" -GF -W- -GL"c:\SDKv4";
#my $SS = "ss.exe"." "."GET"." "."$"."/"."Multum"." "."Production"." "."Software"."\"."SDK4"."\"."DSP"." "."v196"."\"."bin"." "."-GF"." "."-W-"." "."-GL"."c:\SDKv4";

#my $SSENV = "set SSDIR = $ssdir";
#system("$SSENV");
#system("echo %SSDIR%");

#my $SS = "ss.exe"." "."GET"." "."\$"."/"."Multum"." "."Production"." "."Software"."\\SDK4\\DSP"." "."v196"."\\bin"." "."-GF"." "."-W-"." "."-GL"."\"c:\\SDKv4\"";
#my $SS = "ss.exe"." "."GET"." "."\""."\$"."/"."Multum"." "."Production"." "."Software"."\\SDK4\\DSP"." "."v196"."\\bin"."\""." "."-GF"." "."-W-"." "."-GL"."\"c:\\SDKv4\"";
my $SS = "ss.exe"." "."GET"." "."\""."\$"."/"."Multum"." "."Production"." "."Software"."\\SDK4\\DSP"." "."v196"."\\bin"."\""." "."-GF"." "."-W-"." "."-GL"."\"c:\\SDK_Build\\v198\"";



print "$SS\n";
system("$SS");

#system("ss.exe GET "\$\\Multum Production Software\SDK4\DSP v196\bin" -GF -W- -GL"c:\SDKv4");


#c:\SDKv4>"C:\Program Files\Microsoft Visual SourceSafe\"ss.exe GET "$/Multum Production Software\SDK4\DSP v196\bin" -GF -W- -GL"\"c:\SDKv4\""


}

sub PushFiles
{
	my $self      = shift;
	my $ssdir     = $self->{_ssdir};
	my $ssexe     = $self->{_ssexe};
	my $ssfiles   = $self->{_ssfiles};
	my $sstarget  = $self->{_ssfiletar};
}


1;