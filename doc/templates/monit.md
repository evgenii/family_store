0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. you should have already installed monit into your system (on the previous steps)

  $ cd RAILS_APP_ROOT

2. copy monitrc file into a guest mashine
   NOTE: you should have root access for next remote operation (or do it manualy)

  $ scp ./doc/sh_installer/latest/templates/monit/monitrc root@tetra.vm.internal:/etc/monit/monitrc

3. copy configs from conf.d to guest mashine

  $ scp ./doc/sh_installer/latest/templates/monit/conf.d/* root@tetra.vm.internal:/etc/monit/conf.d

4. copy configs into conf-available and the add simlink into conf-enabled

  NOTE: you can remove all default conf-available configs by
  $ ssh root@tetra.vm.internal 'rm /etc/monit/conf-available/*'

  $ scp ./doc/sh_installer/latest/templates/monit/conf-available/* root@tetra.vm.internal:/etc/monit/conf-available
  $ ssh root@tetra.vm.internal ln -s /etc/monit/conf-available/ap /etc/monit/conf-enabled
  $ ssh root@tetra.vm.internal ln -s /etc/monit/conf-available/ssh /etc/monit/conf-enabled
  $ ssh root@tetra.vm.internal ln -s /etc/monit/conf-available/cron /etc/monit/conf-enabled
  $ ssh root@tetra.vm.internal ln -s /etc/monit/conf-available/database /etc/monit/conf-enabled

5. check monit configs/syntax

  $ ssh root@tetra.vm.internal /etc/init.d/monit syntax

5. restart/reload nginx

  $ ssh root@tetra.vm.internal /etc/init.d/monit restart
