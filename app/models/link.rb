class Link

  include DataMapper::Resource

  has n, :tags, :through => Resource
  
  # describe the resources for the model
  property :id, Serial #indicates that it will be auto-incremented for every record
  property :title, String
  property :url, String
  
end