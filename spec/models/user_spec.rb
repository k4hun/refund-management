require 'rails_helper'

RSpec.describe User, type: :model do
	it { should respond_to :email }
	it { should respond_to :password }
	it { should respond_to :applications }
	it { should respond_to :role }
	
	describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :role }
  end

  describe 'database columns' do
    it { should have_db_column :email }
    it { should have_db_column :password_digest }
  end

  describe 'associations' do
    it { is_expected.to belong_to :role }
    it { is_expected.to have_many :applications }
  end
  
  describe 'authenticate' do
    subject do
      User.create(
        email: 'mail@mail.com',
        password: 'secret'
      )
    end
  
    context 'with valid values' do
      it 'should return user' do
        expect(subject.authenticate('secret')).to eq(subject)
      end
    end
    
    context 'with invalid values' do
      it 'should return nil' do
        expect(subject.authenticate('foobar')).to eq(false)
      end
    end
  end
end
