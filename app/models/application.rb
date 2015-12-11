class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    validates :category, :user, presence: true
    validates :description, length: { maximum: 500 }
end