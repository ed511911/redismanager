
#!/usr/local/cpanel/3rdparty/bin/perl

use Net::IP;
use IO::Uncompress::Gunzip qw(gunzip $GunzipError);
use File::Copy;
use Archive::Tar;
use Cpanel::SafeRun::Timed ();
use Cpanel::SafeRun::Errors();
use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

system("clear");
print GREEN "Installing the Redis Manager WHM Plugin...\n";

# Create the directory for the plugin
print YELLOW "Creating /usr/local/cpanel/whostmgr/docroot/cgi/redismanager directory... ";
mkdir "/usr/local/cpanel/whostmgr/docroot/cgi/redismanager";
print CYAN " - Done\n";

# Obtain the plugin from Github
print YELLOW "Downloading redismanager.tar.gz... ";
Cpanel::SafeRun::Timed::timedsaferun( 4, 'wget', '-O', '/root/redismanager.tar.gz', '-o', '/dev/null', "https://github.com/ed511911/redismanager/redismanager.tar.gz" );
print CYAN " - Done\n";

# Uncompress redismanager.tar.gz
print YELLOW "Extracting redismanager.tar.gz... ";
my $tar = Archive::Tar->new;
$tar->read("/root/whmrblcheck.tar.gz");
$tar->extract();
print CYAN " - Done\n";

# Copy the redismanager.jpg (Icon) image file to /usr/local/cpanel/whostmgr/docroot/redismanager
print YELLOW "Copying redismanager.jpg to /usr/local/cpanel/whostmgr/docroot/redismanager... ";
move("/root/redismanager.jpg","/usr/local/cpanel/whostmgr/docroot/redismanager") or die "Copy failed: $!";
print CYAN " - Done\n";

# Copy the redismanager.cgi file to /usr/local/cpanel/whostmgr/docroot/cgi/redismanager
print YELLOW "Copying redismanager.cgi to /usr/local/cpanel/whostmgr/docroot/cgi/redismanager... ";
move("/root/redismanager.cgi","/usr/local/cpanel/whostmgr/docroot/cgi/redismanager") or die "Copy failed: $!";
print CYAN " - Done\n";

# Set execute permissions on the redismanager.cgi script
print YELLOW "Setting permissions on /usr/local/cpanel/whostmgr/docroot/cgi/redismanager/redismanager.cgi to 0755...";
chmod 0755, "/usr/local/cpanel/whostmgr/docroot/cgi/redismanager/redismanager.cgi";
print CYAN " - Done\n";

# Register the plugin
print YELLOW "Registering plugin...";
system( "/usr/local/cpanel/bin/register_appconfig /root/redismanager.conf" );

print GREEN "\nRBL Check WHM Plugin installed!\n";
unlink( "/root/redismanager.tar.gz" );
exit;
