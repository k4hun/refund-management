require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    subject { get :new }
    it { expect(subject).to render_template :new }
  end

  describe 'POST #create' do
    let(:role) { FactoryGirl.create(:role) }
    let(:user_attributes) { FactoryGirl.attributes_for(:user) }
    let(:params) { { user: user_attributes, role_id: role.id } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to root_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'User created'
      end

      it 'creates user' do
        expect{ subject }.to change(User, :count).by(1)
      end
      
      it 'set up session variable' do
        expect{ subject }.to change{ request.session[:user_id] }.from(nil).to(Integer)
      end
    end
  end
end
