#! /bin/sh
start()
{
	journalctl --vacuum-size=500M
}
stop()
{
	echo "This program cann't be stopped"
}
case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		#start
		;;
	*)
		echo "Usage: /etc/init.d/journal-log.sh {start|stop|restart}"
		;;
esac
exit 0
