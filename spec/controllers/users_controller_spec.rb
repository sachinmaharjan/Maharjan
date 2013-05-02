require 'spec_helper'

describe UsersController do
	render_views

	describe "new" do
		it "should respond Users#new" do
			get :new
			response.should be_successful
		end
	end

	describe "POST create" do
		describe "failure" do
			before(:each) do
				@user = FactoryGirl.build(:empty_user)
			end

			it "should not create user" do
				lambda do
					post :create, :user => @user
				end.should_not change(User, :count)
			end

			it "should render the new page" do
				post :create, :user => @user
				response.should render_template('new')
			end
		end

		describe "success" do
			it "should sign the user in" do
				post :create, :user => @user
				controller.should be_signed_in
			end
		end
	end

	describe "show" do

		before(:each) do
			@user = FactoryGirl.build(:user)
			User.stub!(:find, @user.id).and_return(@user)
			get :show, :id => @user
		end


		it "should respond to User#show" do
			response.should be_successful
		end

		it "should have a profile image" do
			response.should have_selector("img", :class => "gravatar")
		end
	end

	describe "edit" do
		before(:each) do
			@user = FactoryGirl.build(:user)
			User.stub!(:find, @user.id).and_return(@user)
			test_sign_in(@user)
		end

		it "should be successful" do
			get :edit, :id => @user
			response.should be_successful
		end
	end

	describe "update" do
		before(:each) do
			@user = FactoryGirl.build(:user)
			User.stub!(:find, @user.id).and_return(@user)
			test_sign_in(@user)
		end

		describe "failure" do
			before(:each) do
				@attr = {:email => "", :name => "", :password => "", :password_confirmation => ""}
			end
			
			it "should render the edit page" do
				post :update, :id => @user, :user => @attr
				response.should render_template('edit')
			end
		end

		describe "success" do
			before(:each) do
				@attr = {:email => "new@name.com", :name => "newname", :password => "password", :password_confirmation => "password"}
			end

			it "should change the user attributes" do
				put :update, :id => @user, :user => @attr
				@user.reload
				@user.name.should == @attr[:name]
				@user.email.should == @attr[:email]
			end

			it "should redirect to the user show page" do
				put :update, :id => @user, :user => @attr
				response.should redirect_to @user
			end

			it "should have a flash message" do
				put :update, :id => @user, :user => @attr
				flash[:success].should =~/updated/
			end
		end

	end

	describe "authentication of edit/update pages" do
		before(:each) do
			@user = FactoryGirl.build(:user)
		end

		describe "for non-signed-in users" do
			it "should deny access to edit page" do
				get :edit, :id => @user
				response.should redirect_to(signin_path)
			end
		end
	end


end
