class User < ApplicationRecord
  #~ before_create :encrypt_password

  # validation
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  validates_length_of     :email, :within => 3..150
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of   :username
  validates_length_of     :password, :within => 4..40
  validates_confirmation_of :password, :if => :password?

  # encrypts given password using salt
  #~ def self.encrypt(pass, salt)
    #~ Digest::SHA1.hexdigest("--#{salt}--#{pass}--" )
  #~ end

end
