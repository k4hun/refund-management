class Category < ActiveRecord::Base
    has_many :applications
    
    validates :name, presence: true
end
