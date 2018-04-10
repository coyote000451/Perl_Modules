#! c:\perl\bin 
use warnings;
use diagnostics;
use DBI;
#use strict;

# Date:  12/11/14
# This is designed to make a connection an access database and return a handle
#
#


package AccessConnect;

sub new
{

	my $class = shift; # shift @_
	my $getDBQ = {
		_dbq => shift,
		_dbname => shift,
	};
	
	bless $getDBQ, $class;
	return $getDBQ;
}

sub DBQPath
{
	my $self = shift;
	$DBQPath = $self->{_dbq};
	my $DBName = $self->{_dbname};
	
	if (! -d $DBQPath)
	{
		printf "\n";
		printf "Not a directory\n";
		printf "\n";
		exit;
	}

print "DBQPath:  $DBQPath\n";
print "DBName:   $DBName\n";


	my $dbh;	
	
#DBQPath:  \\\\gmfileshare01\\multum-production\\ProductionReleases\\VantageRx_UK\\v217_Nov15\\BR\\QA#1_0902\\VantageRx_pt-BR_217.accdb
#DBName:   VantageRx_pt-BR_217.accdb

		#$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb, *.accdb);dbq=\\\\gmfileshare01\\multum-production\\ProductionReleases\\VantageRx_UK\\v217_Nov15\\BR\\QA#1_0902\\VantageRx_pt-BR_217.accdb',Admin,'');
#$DBQPath =~ s/(\$\w+|\${\w+})/$1/eeg;

		#$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb, *.accdb);dbq=$DBQPath\\$DBName',Admin,'');
		$dbh = DBI->connect("dbi:ODBC:driver=microsoft access driver (*.mdb, *.accdb);dbq=$DBQPath\\$DBName",Admin,'');

		$dbh->{'LongTruncOk'} = 1;
		$dbh->{'LongReadLen'} = 65535;

	print "aCCESScONNECT:DBH:  $dbh\n";
	return $dbh;


}
1;

