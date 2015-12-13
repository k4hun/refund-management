class Role < ActiveRecord::Base
    has_many :users
    
    ROLES = %w(admin user)
    
    validates :name, inclusion: { in: ROLES }
end
