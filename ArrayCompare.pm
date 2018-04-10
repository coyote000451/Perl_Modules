use Array::Utils qw(:all);      
use List::MoreUtils;

package ArrayCompare;

sub new
{

	my $class = shift; # shift @_
	my $getArrays = {
		_array1 => shift,
		_array2 => shift,
	};
	
	bless $getArrays, $class;
	return $getArrays;
}
	
sub DiffArray
{
	my $self = shift;
	my $Array1 = $self->{_array1};
	my $Array2 = $self->{_array2);}
		
	my @diff = array_diff(@Array1, @Array2);
	

}










	my @diff = array_diff(@dirList, @refArray);
	foreach my $name (@diff)
	{
	print "*************\nNot Matching:  $name\n";

		my $index = List::MoreUtils::first_index {$_ eq $name} @dirList;
		
		if ($index > 1)
		{
		print "In Destination directory not in Reference\n";
		print "Index of $name = $index\n";
		}
		elsif ($index < 0)
		{
		print "In Reference directory not in Destination\n";
		print "Index of $name = $index\n";
		}
		

	}