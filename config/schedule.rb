# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# require 'stress_test.rb'
set :output, "log/whenever.log"

def export_if_set(symbol)
  env symbol, ENV[symbol.to_s] if ENV[symbol.to_s]
end

export_if_set :PATH

# Oracle
export_if_set :LD_LIBRARY_PATH
export_if_set :DYLD_LIBRARY_PATH
export_if_set :ORACLE_HOME
export_if_set :TNS_ADMIN

# RVM
export_if_set :GEM_HOME