require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  
  # before { login(user) }
  
  describe "GET #new" do
    subject { get :new }
    it { expect(subject).to render_template :new }
  end
  
  describe 'POST #create' do
    let(:params) { { session: {email: user.email, password: user.password} } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to session[:return_to] || root_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Logged in!'
      end
      
      it 'sets session variable' do
        expect{ subject }.to change{ request.session[:user_id] }.to(user.id)
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before { login(user) }
    subject { delete :destroy }
    
    context 'success' do
      it { is_expected.to redirect_to root_path }
      
      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Logged out!'
      end
      
      it 'set session variable to nil' do
        expect{ subject }.to change{ request.session[:user_id] }.to(nil)
      end
    end
  end
end
