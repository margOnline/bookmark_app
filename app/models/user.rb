require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :message => "This email address has already been registered"
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

# call DataMapper's method for validating the model
# in this instance no user will be saved unless the password and
# the password_confirmation match
  validates_confirmation_of :password, :message => "The passwords you entered do not match, please try again"
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
end