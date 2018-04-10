






package CultureArray;

sub new
{
	my $class = shift;
	my $getArray = {
		_culture => shift,
		_version => shift,
		_qa	 => shift,
		_dsp	 => shift,
		
	};

	bless $getArray, $class;
	return $getArray;
}

sub GetArray
{
	my $self 		= shift;
	my $Culture 	= $self->{_culture};
	my $Version 	= $self->{_version};
	my $QA      	= $self->{_qa};
	my $DSP	    	= $self->{_dsp};
	my $StripVer	= $Version;
	$StripVer	=~ s/v//g;
	my $PreVer		= $StripVer - 1;


	if (($Culture =~ m/US/) && ($DSP =~ m/DSPv3/i))
		{
		@CHECK_ARRAY = (
				"CM US 3x Update Images to Installed Images_$Version.html",
				"BCImages",
				"CM US 3x Update Images to Production Images_$Version.html",
				"CM US 3x Update Leaflets to Installed Leaflets_$Version.html",
				"CM US 3x Update Leaflets to Production Leaflets_$Version.html",
				"CM US 3x Update to Current US VantageRx_$Version.html",
				"CM US 3x Update to Current US VantageRx_v$Version.html",
				"CM US 3x Update to Previous CM US 3x Update_v$PreVer.html",
				"CM US DSP to Production Releases US DSP_$Version.html",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"US DSPv3 $Version Bluffton Client Master to CD.html",
				"US DSPv3 $Version Cerner Download to Bluffton Client Master.html"
				);
		}

	elsif (($Culture =~ m/US/) && ($DSP =~ m/SDKv4/i))
			{

		my $ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version $PreVersion SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"US SDKv4 $Version Bluffton Client Master to CD.html",
				"US SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT"
				);	
			}
###

	elsif (($Culture =~ m/SA/) && ($DSP =~ m/SDKv4/i))
			{

		my $ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version $PreVersion SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version--SdkDataFiles to QA-validation file.html",
				"US SDKv4 $Version Bluffton Client Master to CD.html",
				"US SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT"
				);	
			}
###

	elsif (($Culture =~ m/CA/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"BCImages",
				"CA DSPv3 Cerner Download to Bluffton Client Master.html",
				"CA DSPv3 $Version Bluffton Client Master to CD.html",
				"CM CA 3x Update to Current CA VantageRx_$Version.html",
				"CM CA 3x Update to Previous CM CA 3x Update_$Version.html",
				"CM CA DSP to Production Releases CA DSP_$Version.html",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}

	elsif (($Culture =~ m/CA/) && ($DSP =~ m/SDKv4/i))
			{

		my $ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file CA.html",
				"CA SDKv4 $Version Bluffton Client Master to CD.html",
				"CA SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT",
				"CA SDKv4 Cerner Download to Bluffton Client Master.html"
				);	
			}


	elsif (($Culture =~ m/CERN/) && ($DSP =~ m/DSPv3/i))
	{
		
				@CHECK_ARRAY = (
				"BCImages",
				"CA DSPv3 Cerner Download to Bluffton Client Master.html",
				"CA Cerner DSPv3 $Version Bluffton Client Master to CD.html",
				"CM CA Cerner 3x Update to Current CA Cerner VantageRx_$Version.html",
				"CM CA Cerner 3x Update to Previous CM CA Cerner 3x Update.html", 
				"CM CA Cerner DSP to Production Releases CA Cerner DSP_$Version.html",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}

	elsif (($Culture =~ m/CERN/) && ($DSP =~ m/SDKv4/i))
			{

		my $ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version $PreVersion SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4 218 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4 218 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"CA Cerner SDKv4 $Version Bluffton Client Master to CD.html",
				"CA SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT",
				"CA SDKv4 Cerner Download to Bluffton Client Master.html"
				);	
			}

	elsif (($Culture =~ m/AU/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"AU DSPv3 $Version Bluffton Client Master to CD.html",
				"AU DSPv3 $Version Cerner FTP Download to Bluffton Client Masters.html",
				"BCImages",
				"CM AU SDK v3 DSP to Current AU VantageRx_$Version.html",
				"CM AU SDK v3 DSP to Production Releases AU DSP v3 DSP_$Version.html",
				"CM AU SDK v3 DSP_$Version to Previous AU SDK v3.html",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
	);
	}

	elsif (($Culture =~ m/AU/) && ($DSP =~ m/SDKv4/i))
			{

		my $ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"AU SDKv4 Oct14 to Download.html",
				"AU SDKv4 $Version Bluffton Client Master to CD.html",
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v218 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file AU.html",
				"v3tov4CRT"
				);	
			}

	elsif (($Culture =~ m/ES/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"BCImages",
				"ES DSPv3 $Version Bluffton Client Master to CD.html",
				"CM ES 3x Update to Current ES VantageRx_$Version.html",
				"CM ES 3x Update to Previous CM ES 3x Update_$Version.html",
				"CM ES 3x Update to Production Releases ES 3x Update_$Version.htm",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}

	elsif (($Culture =~ m/ES/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare $QA.html",
				"Current version $ShortVersion $QA to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to CLIENT QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to SERVER QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $ShortVersion-$QA-SdkDataFiles to QA-validation file.html",
				"ES SDKv4 $Version Bluffton Client Master to CD.html",
				"ES SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT"
				);	
			}

	elsif (($Culture =~ m/CL/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"BCImages",
				"CL DSPv3 $Version Bluffton Client Master to CD.html",
				"CM CL 3x Update to Current CL VantageRx_$Version.html",
				"CM CL 3x Update to Previous CM CL 3x Update_$Version.html",
				"CM CL 3x Update to Production Releases CL 3x Update_$Version.htm",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}

	elsif (($Culture =~ m/CL/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 3);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare $QA.html",
				"Current version $ShortVersion $QA to Previous version $PreVersion SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to CLIENT QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to SERVER QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"CL SDKv4 $Version Bluffton Client Master to CD.html",
				"CL SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v4tov4CRT"
				);	
			}

	elsif (($Culture =~ m/GB/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"BCImages",
				"GB DSPv3 $Version Bluffton Client Master to CD.html",
				"CM GB SDK v3 DSP to Current GB VantageRx_$Version.html", 
				"CM GB 3x Update to Previous CM GB 3x Update_$Version.html", 
				"CM GB DSP to Production Releases GB DSP_$Version.html", 
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}

	elsif (($Culture =~ m/GB/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 6);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version $PreVersion SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v212 to CLIENT QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v212 to SERVER QA-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file $Culture.html",
				"GB SDKv4 $Version Bluffton Client Master to CD.html",
				"GB SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT"
				);	
			}

	elsif (($Culture =~ m/MY/) && ($DSP =~ m/DSPv3/i))
	{
		@CHECK_ARRAY = (
				"BCImages",
				"GB DSPv3 $Version Bluffton Client Master to CD.html",
				"CM MY SDK v3 DSP to Current MY VantageRx_$Version.html",
				"CM MY 3x Update to Previous CM MY 3x Update_$Version.html",
				"CM MY DSP to Production Releases MY DSP_$Version.htm",
				"File Version Report.doc",
				"File Version Report.rtf",
				"QA-DSPv3 $Version-$QA-plugins to source safe v168.html",
				"QA-DSPv3 $Version-$QA-SdkDataFiles to QA-validation file.html"
				);
	}
#CM MY DSP to Production Releases MY DSP_v206.html
#CM MY SDK v3 DSP to Current MY VantageRx_v206.html

	elsif (($Culture =~ m/MY/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare.html",
				"Current version $ShortVersion to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v212 to CLIENT qa-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v212 to SERVER qa-SDKv4$Version-$QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file $Culture.html",
				"MY SDKv4 $Version Bluffton Client Master to CD.html",
				"MY SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v3tov4CRT"
				);	
			}

	elsif (($Culture =~ m/BR/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare $QA.html",
				"Current version $ShortVersion $QA to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to CLIENT QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to SERVER QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"BR SDKv4 $Version Bluffton Client Master to CD.html",
				"BR SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v4tov4CRT"
				);	
			}

	elsif (($Culture =~ m/MX/) && ($DSP =~ m/SDKv4/i))
			{

		$ShortVersion = $Version;
		$ShortVersion =~ s/v//;
		$PreVersion = ($ShortVersion - 1);

		@CHECK_ARRAY = (
				"BCImages",
				"Current version $ShortVersion Files to Validated Files SDKv4 Client Master Compare $QA.html",
				"Current version $ShortVersion $QA to Previous version SDKv4 Client Master Compare Report.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to CLIENT QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-DevAdmin-Multum Production Software-SDK4v220 to SERVER QA-SDKv4$Version $QA-BIN-SdkDataFilesReport.html",
				"QA-SDK4 $Version-$QA-SdkDataFiles to QA-validation file.html",
				"MX SDKv4 $Version Bluffton Client Master to CD.html",
				"MX SDKv4 $Version Cerner Download to Bluffton Client Master.html",
				"v4tov4CRT"
				);	
			}


	return(@CHECK_ARRAY);
}
1;
