#!c:\perl\bin -w
use diagnostics;
use DBI;
use Win32::OLE;
# 
# 5/1/14
#

package MedGuideLink;

sub new
{
	my $class = shift; # shift @_
	my $elements = {
		_table  => shift,	
		_column => shift,
		_where  => shift,
	
};
	
	bless $elements, $class;
	return $elements;
}

sub MedGuideLink
{
	my $self   =  shift;
	my $table  =  $self->{_table};
	my $column =  $self->{_column};

#
# SQL Server
 #my $DSN = 'driver={SQL Server};Server=ResearchDB; database=Global_Distribute;TrustedConnection=Yes'; 
 #my $dbh = DBI->connect("dbi:ODBC:$DSN") or die "$DBI::errstr\n";
#

# Setting up access
#$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb);dbq=\\\\ada\\1-qa\\AccessDBQA\\VantageRx\\Current Month\\VantageRxDatabase.mdb',Admin,'');

# Changed to *.accdb 2/24/2017
$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb, *.accdb);dbq=\\\\ada\\1-qa\\AccessDBQA\\VantageRx\\Current Month\\VantageRxDatabase.accdb',Admin,'');
#

$dbh->{'LongTruncOk'} = 1;
$dbh->{'LongReadLen'} = 65535;	
	
		$sth = $dbh->prepare("SELECT $column FROM $table");		
		$sth->execute;
		while (my @MedGuideLink = $sth->fetchrow_array)
		{
			push(@ReturnArray, $MedGuideLink[0]);
		}

		$sth->finish;

		return(@ReturnArray);

}

sub MedGuideLinkNDC
{
	my $self   =  shift;
	my $table  =  $self->{_table};
	my $column =  $self->{_column};
	my $where  =  $self->{_where};

#
# SQL Server
 #my $DSN = 'driver={SQL Server};Server=ResearchDB; database=Global_Distribute;TrustedConnection=Yes'; 
 #my $dbh = DBI->connect("dbi:ODBC:$DSN") or die "$DBI::errstr\n";
#

# Setting up access
$dbh = DBI->connect('dbi:ODBC:driver=microsoft access driver (*.mdb, *.accdb);dbq=\\\\ada\\1-qa\\AccessDBQA\\VantageRx\\Current Month\\VantageRxDatabase.accdb',Admin,'');
#

$dbh->{'LongTruncOk'} = 1;
$dbh->{'LongReadLen'} = 65535;	
	
#print "\n";
#print "C: passed in $column\n";
#print "T: passed in $table\n";
#print "W: passed in $where\n";

		$sth = $dbh->prepare("SELECT $column FROM $table where NDC_CODE = '$where'");		
		$sth->execute;
		my @MedGuideLink = $sth->fetchrow_array;

		$sth->finish;

		return(@MedGuideLink);

}
1;



