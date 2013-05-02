require 'spec_helper'

describe SessionsController do

	describe "POST create" do
		describe "with valid email and password" do
			before(:each) do
				@user = FactoryGirl.build(:user)
				@attr = {:email => @user.email, :password => @user.password}
			end

			it "should sign the user in" do
				post :create, :session => @attr
				controller.current_user.should == @user
				controller.should be_signed_in
			end

			it "should redirect to the user to show page" do
				post :create, :session => @attr
				response.should redirect_to @user
			end
		end
	end

	describe "Delete 'destroy'" do
		it "should sign a user out" do
			test_sign_in(FactoryGirl.build(:user))
			delete :destroy
			controller.should_not be_signed_in
			response.should redirect_to(signin_path)
		end
	end
end
