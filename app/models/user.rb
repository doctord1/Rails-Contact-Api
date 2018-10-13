class User < ApplicationRecord
  #~ before_create :encrypt_password

  # validation
  #~ validates_length_of     params[:email], :within => 3..150
  #~ validates_uniqueness_of params[:email], :case_sensitive => false
  #~ validates_presence_of   params[:username]
  #~ validates_length_of     params[:password], :within => 4..40
  #~ validates_confirmation_of params[:password], :if => :password?

  # encrypts given password using salt
  #~ def self.encrypt(pass, salt)
    #~ Digest::SHA1.hexdigest("--#{salt}--#{pass}--" )
  #~ end

end
