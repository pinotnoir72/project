require 'rails_helper'

describe UsersController, type: :controller do
  
  
  user = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user)
  
  describe "GET #show" do
    
    context "when a user is logged in" do
      before do
        sign_in user
      end
      
      it "loads correct user details" do
        get :show, id: user.id
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end
    
    context "when a user is not logged in" do
      it "redirects to login" do
        get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context "when user tries to view user2's page" do
      before do
        sign_in user
      end
      
      it "redirects to root" do
        get :show, id: user2.id
        expect(response).to redirect_to(root_path)
      end
    end
    
  end
  
end