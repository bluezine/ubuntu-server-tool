now=$(date '+%Y%m%d%H%M')
for i in $(find /app/docker -maxdepth 1 -mindepth 1 -type d); do
	if [ "$i" ] && [ "$i" != "/app/docker/backup" ] && [ "$i" != "/app/docker/core" ] ;
	then
		new=$(echo $i | sed 's/\/app\/docker\///g');
		echo /app/docker/backup/$new.$now.tar $i;
		tar -cf /app/docker/backup/$new.$now.tar $i;
	fi
done
echo done
rclone move /app/docker/backup/ GDrive-llt:/backup/bluezine-server/docker -P
echo done
exit 0
