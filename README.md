# kill-openconnect

## Description

These scripts can be used to kill existing openconnect VPN sessions at a specified time.  This may be particularly helpful in scenarios where you occasionally need to be able to access your office workstation remotely but, if you forget to sign out of VPN at the end of the workday, you cannot access your workstation using its assigned IP because the VPN session prevents it.

The scripts are designed for use on Linux workstations where GNOME 3.x is the desktop environment.

When executed, the main `kill-openconnect.sh` script will notify all authenticated users that it will kill any existing `openconnect` sessions in 10 minutes.  Users who have `sudo` permissions can prevent the OpenConnect sessions from ending by terminating the kill script.

## Usage

1. Download both scripts (`kill-openconnect.sh` and `notify-send-all.sh`) and place them in `/usr/local/bin`.
2. Ensure that both scripts are executable by the `root` user only.
	~~~ bash
	$ sudo chown root:root /usr/local/bin/kill-openconnect.sh /usr/local/bin/notify-send-all.sh
	$ sudo chmod 0700 /usr/local/bin/kill-openconnect.sh /usr/local/bin/notify-send-all.sh
	~~~
3. Schedule the `/usr/local/bin/kill-openconnect.sh` script to run from the `root` user's crontab on a schedule that makes sense.  For instance, if your normal work hours are 8:00am-4:30pm, you may wish the script to run hourly from 5pm until 7am.
	~~~ cron
	00 17-23,00-07 * * * /usr/local/bin/kill-openconnect.sh
	~~~
4. When the script runs, it will send a GNOME Shell notification 10 minutes before it attempts to kill any OpenConnect sessions, and every 2 minutes thereafter until the OpenConnect session is terminated.
