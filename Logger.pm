package Logger; 
#This Logger module helps the other modules to log useful messages. 

use Exporter; # for exporting some methods from this class. 

@ISA = qw(Exporter ); 

#The "Log::Agent" module provides an abstract layer for logging and tracing. 
use Log::Agent qw(logwrite logerr logdie); 

#The file logging driver redirects logxxx() operations to specified files, one per 
#channel usually (but channels may go to the same file). 
use Log::Agent::Driver::File; 

#The "Log::Agent::Rotate" class holds the parameters describing the logfile rotation policy, 
#and is meant to be supplied to instances of "Log::Agent::Driver::File" via arguments in the 
#creation routine, such as "-rotate", or by using array references as values 
#in the "-channels" hashref 
use Log::Agent::Rotate; 

# exporting two necessary methods for writing some useful logs, to trace the error 
# in the program execution if any. 
@EXPORT = qw(logwrite logerr logdie); 


################################################################################ 
# logging priorities 
################################################################################ 
#Name    Level   Traditional    Export 
#--------- -----  --------------  ------ 
#none       -1                    NONE    (special, see text) 
#emergency   0    (emerg, panic)  EMERG 
#alert       1                    ALERT 
#critical    2    (crit)          CRIT 
#error       3    (err)           ERROR 
#warning     4                    WARN 
#notice      6                    NOTICE 
#info        8                    INFO 
#debug       10                   DEBUG 
################################################################################ 

#=============================================================================== 
#         NAME:  Initialize 
#      PURPOSE:  to prepare the log file rotation policy and configure the logging channels 
#      RETURNS:  object of the current module. 
#=============================================================================== 
sub Initialize 
{ 
        my($Self) = shift; 
        my($driver,$policy); 

# create the logfile rotation policy 
        $RotatePolicy = Log::Agent::Rotate->make( 
#The total amount of old logfiles to keep, besides the current logfile. 
                        -backlog     => 7, 
# The amount of old logfiles, amongst the most recent ones, that should not be com- 
# pressed but be kept as plain files. 
                        -unzipped    => 2, 
# The maximum logfile size.  This is a threshold, which will cause a logfile rotation 
# cycle to be performed, when crossed after a write to the file.  If set 
# to 0, this threshold is not checked. 
                        -max_size    => 100*1024*1024, # 100M 
# The maximum time in seconds between the moment we opened the file and the next rota- 
# tion cycle occurs.  This threshold is only checked after a write to the file. 
                        -max_time    => "1d", # 1 day 
                        ); 

# make the file driver ready for logging on files 
        $driver = Log::Agent::Driver::File->make( 
# string to be prefixed on all messages 
                        -prefix     => "LogDemo", 
# timestamp format 'yy/mm/dd hh:mm:ss' 
                        -stampfmt   => "own", 
# to duplicate the error channel into the output channel messages with a prefixing made to clearly mark them as such: "FATAL: " for logdie(), logcroak() and logconfess(), "ERROR: " for logerr() and "WARNING: " for logwarn(). 
                        -duperr    => 1, 
# Specifies where channels go 
                        -channels   => { 
                                debug    => [ "/tmp/debug.log", $RotatePolicy ], 
                                output   => [ "/tmp/output.log", $RotatePolicy ], 
                                error    => [ "/tmp/error.log", $RotatePolicy ], 
                        }, 
# Specifies the file permissions for the channels specified by "-channels". 
                        -chanperm   => { 
                                debug   => 0644, 
                                output  => 0644, 
                                error   => 0644, 

                        } 
                        ); 

# specfiy the logging to the file via the Driver::File 
        Log::Agent::logconfig(-confess => 1,  -driver => $driver,  -debug => 1); 
        $Self; 
} 

#=============================================================================== 
#         NAME:  new 
#      PURPOSE:  to create object for class 
#      RETURNS:  object of the called class 
#=============================================================================== 
sub new 
{ 
        my($Class) = shift; # getting the class name 
        my $Self = bless {}, ref($Class) || $Class; 
        my $ObjectName = ref($Self); 
        $Self->Initialize(); 
        $Self; 
} 

1; 
