# encoding: utf-8

##
# Backup v4.x Configuration
#
# Documentation: http://backup.github.io/backup
# Issue Tracker: https://github.com/backup/backup/issues

user_name= 'tetra'
app_name = 'ap_dev_application'
app_path = ENV['APP_PATH'] || "/home/#{user_name}/#{app_name}"
storage_apth = ENV['STORAGE_PATH'] || "/home/#{user_name}/backups/#{app_name}"

# $ backup perform -t tetra_ap_dev_daily [-c <path_to_configuration_file>]
# $ backup perform -t tetra_ap_dev_monthly [-c <path_to_configuration_file>]

Notifier::Mail.defaults do |mail|
  mail.from                 = "backup.dev.ap@tetra.ua"
  mail.to                   = "semenchuk@tetra.ua"
  mail.address              = "smtp.gmail.com"
  mail.port                 = 587
  mail.domain               = "tetra.ua"
  mail.user_name            = "redmin@tetra.ua"
  mail.password             = "AFgrsGgf4g5df4gd4gf5df5gSAdfg_!!ds"
  mail.authentication       = "plain"
  mail.encryption           = :starttls
end

##
# Preconfigured Models
#
preconfigure 'MyModel' do
  database MySQL do |db|
    db.name               = "db_name"
    db.username           = "username"
    db.password           = "pass"
    db.host               = "localhost"
    db.port               = 3306
    db.additional_options = ["--quick", "--single-transaction"]
  end

  archive :system_data do |archive|
    archive.add "#{app_path}/shared/public/system"
    archive.exclude "#{app_path}/shared/public/system/.svn"
  end

  compress_with Gzip

end

# $ backup perform -t tetra_ap_dev_daily [-c <path_to_configuration_file>]
#
MyModel.new(:tetra_ap_dev_daily, 'Daily backup of dev.atlant-protocol.com') do
  store_with Local do |local|
    local.path = storage_apth
    local.keep = 14
  end
end

# $ backup perform -t tetra_ap_dev_monthly [-c <path_to_configuration_file>]
#
MyModel.new(:tetra_ap_dev_monthly, 'Monthly backup of dev.atlant-protocol.com') do
  store_with Local do |local|
    local.path = storage_apth
    local.keep = 12
  end
end
