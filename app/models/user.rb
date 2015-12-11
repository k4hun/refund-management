class User < ActiveRecord::Base
    belongs_to :role
    
    validates :email, :password, :role, presence: true
end
