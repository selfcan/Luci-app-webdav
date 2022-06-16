echo luci for webdav
local vt_enabled=`uci get webdav.@arguments[0].enabled 2>/dev/null`
echo $vt_enabled 
if [ "$vt_enabled" = 1 ]; then
	logger -t alex restarting webdav
 	echo "restarting webdav"
	/etc/init.d/webdav enable
	/etc/init.d/webdav restart
else	
	logger -t alex stopping pdnsd
	echo "stopping webdav"
	/etc/init.d/webdav disable
	/etc/init.d/webdav stop
fi
