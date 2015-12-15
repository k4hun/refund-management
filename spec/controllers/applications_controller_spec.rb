require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  
  let(:role) { FactoryGirl.create(:role) }
  let(:user) { FactoryGirl.create(:user) }
  let(:app) { FactoryGirl.create(:application) }

  before { login(user) }
  
  describe "GET #index" do
    subject { get :index }
    it { expect(subject).to render_template :index }
  end

  describe "GET #new" do
    subject { get :new }
    it { expect(subject).to render_template :new }
  end

  describe "GET #edit" do
    subject { get :edit, id: app.id }
    it { expect(subject).to render_template :edit }
  end

  describe 'POST #create' do
    let(:application_attributes) do
      FactoryGirl.attributes_for(:application).merge(owner_attributes: FactoryGirl.attributes_for(:user))
    end
    let(:params) { { application: application_attributes } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to applications_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Refund application has been sent to admin'
      end

      it 'creates application' do
        expect{ subject }.to change(Application, :count).by(1)
      end
    end
  end
  
  describe 'PUT #update' do
    let(:category) { FactoryGirl.create(:category) }
    let(:refund_value) { 33 }
    
    context 'approved' do
      let(:params) { { 
        id: app.id, 
        application: { 
          category_id: category.id, 
          refund_value: refund_value 
        }
      } }
      subject { put :update, params }
      it { is_expected.to redirect_to applications_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq 'Application approved'
      end

      it 'updates application' do
        expect{ subject }.to change(Application, :count).by(1)
      end
    end
  end

  describe 'POST #reject' do
    subject { post :reject, id: app.id }

    it { is_expected.to redirect_to applications_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq 'Application rejected'
    end
  end
end
