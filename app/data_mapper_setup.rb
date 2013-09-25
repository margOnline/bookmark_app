# set the environment to test, development or production
# depending on the variable in spec helper
env = ENV["RACK_ENV"] || "development"

# tell datamapper to use the postgres d/b on localhost
# which will be appended with the env variable
DataMapper.setup(:default, "postgres://localhost/bookmark_app_#{env}")

# after declaring the model, you need to finalise them
DataMapper::finalize

# make non-destructive changes - if they tables don't exist, they
# will be created. If they do and the schema has changed, 
# auto-updgrade! forces the tables to  be created as described 
# in the model EVEN IF it leads to data loss
DataMapper.auto_upgrade!