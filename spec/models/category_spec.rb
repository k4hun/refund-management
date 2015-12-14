require 'rails_helper'

RSpec.describe Category, type: :model do
	it { should respond_to :name }
	it { should respond_to :applications }
	
	describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'database columns' do
    it { should have_db_column :name }
  end

  describe 'associations' do
    it { is_expected.to have_many :applications }
  end
end
