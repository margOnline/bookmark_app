# set the environment to test, development or production
# depending on the variable in spec helper
env = ENV["RACK_ENV"] || "development"

# tell datamapper to use the postgres d/b on localhost
# which will be appended with the env variable
DataMapper.setup(:default, "postgres://localhost/bookmark_app_#{env}")

# after declaring the model, you need to finalise them
DataMapper.finalize
