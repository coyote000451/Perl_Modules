################################################################################
# This simple class just takes passed in directory path with XML file and
# returns an XML object
################################################################################
# Created 12/17/13
################################################################################
# Updates:
# 
################################################################################
# It is instantiated as:  
# $DIR_PATH = "c:\\temp\\PCDD\\";
#
# $TOP_DIR = ReadDir->new($DIR_PATH);
# @DirArray = $TOP_DIR->Directory();
#
# for $file (@DirArray) 
# {
#	print "$file\n";
#
#	if ($file =~ m/ingredient2/)
#	{
#	#$SCRAPE = XMLScrape->new($DIR_PATH, "f_ingredient2_3051213.xml");
#	$SCRAPE = XMLScrape->new($DIR_PATH, $file);
#	$XMLReturn = $SCRAPE->scrape();
#
#	use Data::Dumper; #this can't be declared outside of the subroutine
#	#print Dumper($XMLReturn);
#	#print "$XMLReturn->{ING}->[0]->{NM}\n";
#	#print "$XMLReturn->{ING}->[0]\n";
#	print Dumper($XMLReturn->{ING}->[0]);
#	print Dumper($XMLReturn->{ING}->[1]);
#	print Dumper($XMLReturn->{ING}->[2]);
#	print Dumper($XMLReturn->{ING}->[3]);
#	}
# }
################################################################################ 

use XML::Parser;
use XML::Simple;
use Data::Dumper;

# Need to pass in the path and file BTW

package XMLScrape;

sub new
{

	my $class = shift; # shift @_
	my $getXML = {
		_path => shift,
		_file => shift,
	};
	
	bless $getXML, $class;
	return $getXML;
}

sub scrape # do we want to scrape with separate table name methods?
{
	my $self = shift;
	my $Path = $self->{_path};
	my $File = $self->{_file};
	$xml = new XML::Simple;
	
	use Data::Dumper; #this can't be declared outside of the subroutine
	$booklist = $xml->XMLin($Path.$File);
	return $booklist;

}
1;