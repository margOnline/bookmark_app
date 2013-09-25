require 'data_mapper'
require '.app/data_mapper_setup'

task :auto_migrate do
  # non destructive changes to the tables which will be created if they
  # don't exist UNLESS the schema has changed they wil not be upgraded as
  # that would lead to data loss.
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (no data loss)"
end

task :auto_upgrade do
 # to force the creation of all tables as described in the models, even if it
 # leads to data loss 
 DataMapper.auto_upgrade!
 puts "Auto-upgrade complete (data was lost)"
end
