#! /bin/sh
start()
{
	sleep 30
	reboot -f
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
		echo "Usage: /etc/init.d/test-reboot {start|stop|restart}"
		;;
esac
exit 0
