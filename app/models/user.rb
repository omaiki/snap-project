require 'bcrypt'

class User < ActiveRecord::Base
   # users.password_hash in the database is a :string
  include Bcrpyt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

end


# password_hash is stored in database
# password is what you are using from bcrypt