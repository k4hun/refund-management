class User < ActiveRecord::Base
    belongs_to :role
    has_many :applications
    has_secure_password
    
    validates :email, :password, :role, presence: true
    
    def self.authenticate(email, password)
    account_check = self.where(email: email).first
    account_check.authenticate(password) if account_check
  end
end
