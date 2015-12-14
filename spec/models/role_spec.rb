require 'rails_helper'

RSpec.describe Role, type: :model do
	it { should respond_to :name }
	it { should respond_to :users }
	
	describe 'validations' do
    it { is_expected.to validate_presence_of(:name).with_message('is not included in the list') }
    it { is_expected.to validate_inclusion_of(:name).in_array(%w(admin user)) }
  end

  describe 'database columns' do
    it { should have_db_column :name }
  end

  describe 'associations' do
    it { is_expected.to have_many :users }
  end
end
