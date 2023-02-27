
#!/bin/bash
echo "Uninstalling the Redis Manager WHM Plugins..."

echo -n "Removing redismanager.jpg from the /usr/local/cpanel/whostmgr/docroot/redismanager/ directory "
rm -f /usr/local/cpanel/whostmgr/docroot/redismanager/redismanager.jpg
echo "Done"

echo -n "Removing redismanager.cgi from the /usr/local/cpanel/whostmgr/docroot/cgi/redismanager/ directory "
rm -f /usr/local/cpanel/whostmgr/docroot/cgi/redismanager/redismanager.cgi
echo "Done"

echo -n "Removing the redismanager directory from the /usr/local/cpanel/whostmgr/docroot/cgi/ directory "
rmdir /usr/local/cpanel/whostmgr/docroot/cgi/redismanager
echo "Done"

echo -n "Removing the redismanager.tar.gz file from the /root/ directory "
rm -f /root/redismanager.tar.gz
echo "Done"

echo -n "Removing the redismanager_install.pl file from the /root/ directory "
rm -f /root/redismanager_install.pl
echo "Done"

echo -n "Removing the redismanager.conf file from the /root/ directory "
rm -f /root/redismanager.conf
echo "Done"

echo -n "Unregistering the appconfig... "
/usr/local/cpanel/bin/unregister_appconfig /var/cpanel/apps/redismanager.conf
echo "Done"


echo "RBL Check WHM Plugin has been successfully removed."
rm -f /root/redismanager_uninstall.sh
