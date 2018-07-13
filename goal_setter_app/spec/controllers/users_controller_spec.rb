require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders sign up page' do
      get :new 
      expect(response).to render_template('new')
    end
  end
  
  describe "POST #create" do
    it 'validates presence of username and password' do
      post :create, params: {user: {username: 'harrypotter', password: ''}}
      expect(response).to redirect_to(new_user_url)
      expect(flash[:errors]).to be_present
    end
    
    it 'validates that password is >= 6 characters' do
      post :create, params: {user: {username: 'harrypotter', password: 'short'}}
      expect(response).to redirect_to(new_user_url)
      expect(flash[:errors]).to be_present
    end
  end
end

