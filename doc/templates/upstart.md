0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. First, you need to create start script (see template in init.d dir):

  $ vi /etc/init.d/ap_unicorn

2. Then, you need to create a systemd startup script:

$ vi /etc/systemd/system/debian.pgok_ap_unicorn.service

  [Unit]
  After=network.target

  [Service]
  ExecStart=/etc/init.d/ap_unicorn pgok start

  [Install]
  WantedBy=default.target

DESCRIPTION:
  After: Instructs systemd on when the script should be run. In our case the script will run after network has started.
  ExecStart: This field provides a full path the actual script to be execute.
  WantedBy: Into what boot target the systemd unit should be installed
  Configure and Install:


3. Open a terminal and run:

  $ exec sudo -i
  $ chmod +x /etc/init.d/ap_unicorn
  $ chmod 664 /etc/systemd/system/debian.pgok_ap_unicorn.service
  $ systemctl daemon-reload
  $ systemctl enable debian.pgok_ap_unicorn.service

4. Make 1-3 steps for loops
