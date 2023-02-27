#!/usr/bin/perl

use strict;
use warnings;

my $cpanel_user = $ENV{'REMOTE_USER'};

if (not defined $cpanel_user) {
    die "This script must be run from within cPanel\n";
}

print "cPanel User: $cpanel_user\n";

my @accounts = `ls /var/cpanel/users`;

foreach my $account (@accounts) {
    chomp $account;

    # Skip the cPanel system account
    next if $account eq 'system';

    my $domain = `grep "^DNS.*:$account:" /etc/userdomains | awk -F ':' '{print \$1}'`;
    chomp $domain;

    print "$account\t$domain\n";
}
