#!/bin/bash

uSmbPass="1234"

declare -A usersAndGroups=([kustadmin]="mainAdminGroup" [camadmin]="camAdminGroup" [asteradmin]="asterAdminGroup" [asterrecsender]="mainAdminGroup" [camrecsender]="mainAdminGroup")

for user in ${!usersAndGroups[@]}
do
	#Add admin group to system
	addgroup ${usersAndGroups[$user]}

	#Add user with no shell
	adduser -H -D -s /bin/false $user

	#Add user to user`s spec. group
	adduser $user ${usersAndGroups[$user]}

	#Set pass to user in samba
	echo -ne "$uSmbPass\n$uSmbPass\n" | /usr/bin/smbpasswd -s -a $user
done

mkdir -p /media/kustsambadata/camerarec
mkdir -p /media/kustsambadata/asteriskrec

chgrp mainAdminGroup /media/kustsambadata/*

chmod 775 media/kustsambadata/*

/usr/sbin/smbd -D

tail -F /dev/null
