#!/usr/bin/env bash

USER=tetra
RUBY_VERSION=ruby-2.3.0@global
PATH_TO_CONFIGS=/home/$USER/backups/configs

# load rvm ruby
source /home/$USER/.rvm/environments/$RUBY_VERSION

WRONG_COMMAND_MSG="Usage: backup.sh {ap_dev} {daily|monthly}"

case "$1" in
  ap_dev)
    DESC='projects.tetra.ua'
    TRIGGER_NAME=tetra_ap_dev
    CONFIG_FILE=$PATH_TO_CONFIGS/ap_backup4.cfg.rb
    ;;
  *)
    echo $WRONG_COMMAND_MSG >&2
    exit 1
    ;;
  esac

case "$2" in
  daily)
    TRIGGER_NAME="$TRIGGER_NAME"_daily
    ;;
  monthly)
    TRIGGER_NAME="$TRIGGER_NAME"_monthly
    ;;
  *)
    echo $WRONG_COMMAND_MSG >&2
    exit 1
    ;;
  esac

backup perform --trigger $TRIGGER_NAME --config-file $CONFIG_FILE
