require 'rails_helper'

RSpec.describe Application, type: :model do
	subject do
		Application.new(
			description: "Foo bar"
		)
	end
	
	it { should respond_to :description }
	it { should respond_to :user }
	it { should respond_to :category }
	it { should respond_to :refund_value }
	it { should respond_to :status }
	
	describe 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end

  describe 'database columns' do
    it { should have_db_column :description }
    it { should have_db_column :user_id }
    it { should have_db_column :category_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :category }
  end
  
  describe 'refund value' do
  	before do
  		subject.save
  	end
  	
  	it 'is set to 1' do
  		expect(subject.refund_value).to eq(1)
  	end
  end
  
  describe '.approve' do
  	before do 
  		subject.approve
  	end
  	
  	it 'should change status to approved' do
  		expect(subject.status).to eq('approved')
  	end
  end
  
  describe '.approve' do
  	before do 
  		subject.reject
  	end
  	
  	it 'should change status to rejected' do
  		expect(subject.status).to eq('rejected')
  	end
  end
end
