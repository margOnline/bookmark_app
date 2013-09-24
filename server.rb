env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postrgres://localhost/bookmark_app_#{env}")
require '.lib/link'

DataMapper::finalize
DataMapper.auto_updgrade!

dbtype://user:password@hostname:port/databasename