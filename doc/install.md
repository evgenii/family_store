Steps to install atlant-protocol on server
==========================================

0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. install server utilities and libraries
  configure variables on latest.sh then execute it to install utilities and libraries
  $ bash $RAILS_ROOT/doc/sh_installer/latest/latest.sh

2. deploy AP application (see templates/deploy_app.md)

3. configure nginx (see $RAILS_ROOT/doc/sh_installer/latest/templates/nginx.md)

4. create/install autostart scripts for ap_unicorn (see $RAILS_ROOT/doc/sh_installer/latest/templates/upstart.md)
4. create/install autostart scripts for loops (see $RAILS_ROOT/doc/sh_installer/latest/templates/upstart.md)

5. configure monit (see $RAILS_ROOT/doc/sh_installer/latest/templates/monit.md)

6. configure backups (see $RAILS_ROOT/doc/sh_installer/latest/templates/backups.md)

6. configure partitions (see $RAILS_ROOT/doc/sh_installer/latest/templates/partitions.md)
