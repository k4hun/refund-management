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
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.role = Role.find_by_name('user')
      user.password = Faker::Internet.password
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end
  
  scope :with_approved_applications, -> { joins(:applications).merge(Application.where(status: 'approved')) }
  
end
