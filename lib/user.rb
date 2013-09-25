require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

# call DataMapper's method for validating the model
# in this instance no user will be saved unless the password and
# the password_confirmation match
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
end