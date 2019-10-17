require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { @user = FactoryBot.create(:user) }

  describe 'GET #show' do
     context 'when a user is logged in' do
     	before do
     		sign_in user
     	end
     	it "loads correct user details" do
     		get :show, params: { id: user.id }
     		 expect(response).to be_ok
				 expect(assigns(:user)).to eq user
			end
     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
  end
end