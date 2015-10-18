#! /bin/sh
### BEGIN INIT INFO
# Provides: vmstat-snap
# Required-Start: $local_fs $remote_fs
# Required-Stop:
# X-Start-Before: rmnologin
# Default-Start: 2 3 4 5
# Default-Stop:
# Short-Description: Provides vmstat info every 5 seconds
# Description: Provide vmstat info every 5 seconds for system performance analysis.
### END INIT INFO

. /lib/lsb/init-functions

N=/etc/init.d/vmstat-snap
PIDFILE=/root/vmstat.pid
set -e
case "$1" in

        start)
	                #run your script here (vmstat-run.sh)
			                echo “started vmstat-snap”
					                ./vmstat-run.sh
							                ;;
									        stop)
										                kill $(cat $PIDFILE) && rm -f vmstat.pid
												                echo “stopped vmstat-snap”
														                ;;
																        status)
																	                if [ -f vmstat.pid ]; then
																			                        echo “vmstat-snap running”
																						                else
																								                        echo “vmstat-snap is stopped”
																											                fi
																													                ;;
																															        restart)
																																                $0 stop
																																		                /etc/init.d/vmstat-snap start
																																				                ;;
																																						        *)
																																							                echo "Usage: $N {start|stop|status|restart}" >&2
																																									                exit 1
																																											                ;;
esac
exit 0
