# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

defined?(OpenSSL) ? PG.init_openssl(false, false) : PG.init_openssl(true, true)

Rails.application.load_tasks
