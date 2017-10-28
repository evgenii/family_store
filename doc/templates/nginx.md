0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. you should have already installed nginx into your system (on the previous steps)

  $ cd RAILS_APP_ROOT

2. copy nginx.conf file into a guest mashine
   NOTE: you should have root access for next remote operation (or do it manualy)

  $ scp ./doc/sh_installer/latest/templates/nginx/nginx.conf root@tetra.vm.internal:/etc/nginx/nginx.conf

3. copy configs from conf.d to guest mashine

  $ scp ./doc/sh_installer/latest/templates/nginx/conf.d/* root@tetra.vm.internal:/etc/nginx/conf.d

4. copy AP app config into sites-available and the add simlink into sites-enabled

  $ scp ./doc/sh_installer/latest/templates/nginx/sites-available/ap.local root@tetra.vm.internal:/etc/nginx/sites-available/ap.local
  $ ssh root@tetra.vm.internal ln -s /etc/nginx/sites-available/ap.local /etc/nginx/sites-enabled/ap.local

5. copy Monit app config into sites-available and the add simlink into sites-enabled

  $ scp ./doc/sh_installer/latest/templates/nginx/sites-available/monit.local root@tetra.vm.internal:/etc/nginx/sites-available/monit.local
  $ ssh root@tetra.vm.internal ln -s /etc/nginx/sites-available/monit.local /etc/nginx/sites-enabled/monit.local

6. check nginx configs by:

  $ ssh root@tetra.vm.internal /etc/init.d/nginx configtest

7. restart/reload nginx

  $ ssh root@tetra.vm.internal /etc/init.d/nginx restart
