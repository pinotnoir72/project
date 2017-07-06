require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    
  end

  describe 'GET #show' do

    context 'User is logged in' do
      before do
        sign_in @user
      end
      
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

      it 'other users profile restricted' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
      
    end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user.id }
         expect(response).to redirect_to(new_user_session_path)
       end

     end


      context "User2 cannot access User#Show" do
        before do 
          sign_in @user2
        end

        it "redirects to root_path instead" do
          get :show, params: {id: @user2.id}
          expect(response).to redirect_to(root_path)
        end

      end

  end
end