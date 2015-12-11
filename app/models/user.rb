class User < ActiveRecord::Base
    belongs_to :role
    has_many :applications
    has_secure_password
    
    validates :email, :password, :role, presence: true
end
