class Application < ActiveRecord::Base
	before_validation(on: :create) do
    self.refund_value = 1
  end

	belongs_to :user
	belongs_to :category
	
	validates :user, :description, presence: true
	validates :description, length: { maximum: 500 }
	validates :refund_value, inclusion: { in: 1..100, message: 'Must be between 1 and 100' }

	def approve
		self.status = 'approved'
		self.save
	end

	def reject
		self.status = 'rejected'
		self.save
	end

	self.per_page = 15
	
	scope :approved, -> { where(status: 'approved') }
	scope :from_last_month, -> { where('created_at > ?', 1.month.ago) }
end