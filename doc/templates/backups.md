0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. create backup.sh file from template (see templates/backups/backup.sh)

2. copy it to user home directory (/home/tetra/backup.sh)

  $ scp ./doc/sh_installer/latest/templates/backups/backup.sh root@tetra.vm.internal:/home/tetra/backup.sh

3. configure backup4.conf.rb in ~/application/app_configs/backup4.conf.rb
   or copy it from templates (see templates/backups/configs/backup4.conf.rb)

4. try to create backups manualy

5. add workers into user crontab for example use file from tempates (see templates/contab/config.cfg)

  $ crontab -e


