# encoding: utf-8

require "spec_helper"

describe User do
  before(:each) do
    # @user = User.new(name: "sachin maharjan", email: "test@maharjan.com")
    @user = FactoryGirl.build(:user)
  end
  it "should create a correct factory" do
    @user.should be_valid
  end

  it "should respond to name" do
    @user.should respond_to(:name)
  end
  
  it "should respond to password" do
    @user.should respond_to(:password)
  end
  
  it "should respond to password confirmation" do
    @user.should respond_to(:password_confirmation)
  end
  
  it "should respond to encrypted_password" do
    @user.should respond_to(:encrypted_password)
  end
  
  it "should respond to email" do
    @user.should respond_to(:email)
  end

  it "should have valid username" do
    @user = FactoryGirl.build(:user, :name => "")
    @user.should_not be_valid
  end
  it "should have a valid email" do
    @user = FactoryGirl.build(:user, :email => "")
    @user.should_not be_valid
  end
  
  it "should not have too long name" do
    @user = FactoryGirl.build(:user, :name => "aa" * 51)
    @user.should_not be_valid
  end
  
  it "should not have too short name" do
    @user = FactoryGirl.build(:user, :name => "a")
    @user.should_not be_valid
  end
  
  it "should have valid email address" do
    @user = FactoryGirl.build(:user, :email => "apple")
    @user.should_not be_valid
  end
  
  it "should have unique email address" do
    @user1 = FactoryGirl.build(:user, :email => "sachin@maharjan.com")
    @user2 = FactoryGirl.build(:user, :email => "sachin@maharjan.com")
    @user1.save
    @user2.save
    @user1.should be_valid
    @user2.should_not be_valid
  end
  
  it "should have unique email address ignoring case" do
     @user1 = FactoryGirl.build(:user, :email => "sachin@maharjan.com")
     @user2 = FactoryGirl.build(:user, :email => "SACHIN@MAHARJAN.COM")
     @user1.save
     @user2.save
     @user1.should be_valid
     @user2.should_not be_valid
  end
  
  it "should have password" do
    @user = FactoryGirl.build(:user, :password => "", :password_confirmation => "")
    @user.should_not be_valid
  end
  
  it "should have the same password" do
    @user.should be_valid
  end
  
  it "should not have different password" do
     @user = FactoryGirl.build(:user, :password => "password", :password_confirmation => "anotherpassword")
     @user.should_not be_valid
  end
  
  it "should set the encrypted password" do
    @user = FactoryGirl.build(:user, :password => "password", :password_confirmation => "password")
    @user.save!
    @user.encrypted_password.should_not be_blank
  end

  describe  "has password? method" do
    
    it "should be true if the password match" do
      @user = FactoryGirl.build(:user, :password => "password", :password_confirmation => "password")
      @user.save!
      @user.has_password?("password").should be_true
    end

    it "should be false if the passwords do not match" do
      @user.has_password?("invalid").should be_false
    end
  end
  

  
  
end
