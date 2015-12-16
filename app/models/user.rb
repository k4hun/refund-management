class User < ActiveRecord::Base
  belongs_to :role
  has_many :applications
  has_secure_password
  
  validates :email, :password, :role, presence: true
  validates :email, format: { with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/), message: 'bad format of an email' }
    
  def self.authenticate(email, password)
    account_check = self.where(email: email).first
    account_check.authenticate(password) if account_check
  end
  
  scope :with_approved_applications, -> { joins(:applications).merge(Application.where(status: 'approved')) }
  
end
