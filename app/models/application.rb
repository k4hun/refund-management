class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    validates :category, :user, presence: true
    validates :refund_value, inclusion: { 1..100 }
    validates :description, length: { maximum: 500 }
end
