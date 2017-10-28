0. IMPORTANT: before copy or execute file REVIEW them !!! you do it for a own risk !!!

1. you should have already have gem capistano on your develop mashine, then run

  $ cd RAILS_APP_ROOT
  $ cap local deploy:setup

  for create all needed direcory and then:

  $ cap local deploy:cold

  for deploing application first time

2. add to /etc/hosts groupe aliases

  127.0.0.1   ap.remote
  127.0.0.1   pgok.corp
  127.0.0.1   api.pgok.corp
  127.0.0.1   monit.pgok.corp
