class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    
    validates :category, :user, presence: true
    validates :description, length: { maximum: 500 }

    def approve
    	unless self.approved
    		self.approved = true
    		self.save
    	end
    end
end