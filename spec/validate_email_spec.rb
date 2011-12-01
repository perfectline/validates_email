require 'spec_helper'

describe "Email validation" do

  before(:all) do
    ActiveRecord::Schema.define(:version => 1) do

      create_table :users, :force => true do |t|
        t.column :email_address, :string
      end

    end
  end

  after(:all) do
    ActiveRecord::Base.connection.drop_table(:users)
  end

  context "with regular validator" do
    before do
      @user = User.new
    end

    it "should not allow nil as email" do
      @user.email_address = nil
      @user.should_not be_valid
    end

    it "should not allow blank as email" do
      @user.email_address = ""
      @user.should_not be_valid
    end

    it "should not allow an email without domain extension" do
      @user.email_address = "user@example"
      @user.should_not be_valid
    end

    it "should not allow an email without @" do
      @user.email_address = "user"
      @user.should_not be_valid
    end

    it "should not allow an email without prefix" do
      @user.email_address = "@example.com"
      @user.should_not be_valid
    end

    it "should not allow an email without domain" do
      @user.email_address = "user@.com"
      @user.should_not be_valid
    end

    it "should accept a valid email address" do
      @user.email_address = "user@example.com"
      @user.should be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is not a valid email address"]
    end
  end

  context "with allow nil" do
    before do
      @user = UserWithNil.new
    end

    it "should allow nil as email" do
      @user.email_address = nil
      @user.should be_valid
    end

    it "should not allow blank as email" do
      @user.email_address = ""
      @user.should_not be_valid
    end

    it "should allow a valid email address" do
      @user.email_address = "user@example.com"
      @user.should be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is not a valid email address"]
    end
  end

  context "with allow blank" do
    before do
      @user = UserWithBlank.new
    end

    it "should allow nil as email" do
      @user.email_address = nil
      @user.should be_valid
    end

    it "should allow blank as email" do
      @user.email_address = ""
      @user.should be_valid
    end

    it "should allow a valid email address" do
      @user.email_address = "user@example.com"
      @user.should be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is not a valid email address"]
    end
  end

  context "with legacy syntax" do
    before do
      @user = UserWithLegacy.new
    end

    it "should allow nil as email" do
      @user.email_address = nil
      @user.should be_valid
    end

    it "should allow blank as email" do
      @user.email_address = ""
      @user.should be_valid
    end

    it "should allow a valid email address" do
      @user.email_address = "user@example.com"
      @user.should be_valid
    end

    it "should not allow invalid email" do
      @user.email_address = "random"
      @user.should_not be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is just wrong!"]
    end
  end

  context "with ActiveRecord" do
    before do
      @user = UserWithAr.new
    end

    it "should not allow invalid email" do
      @user.email_address = ""
      @user.should_not be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is not right"]
    end
  end

  context "with ActiveRecord and legacy syntax" do
    before do
      @user = UserWithArLegacy.new
    end

    it "should not allow invalid email" do
      @user.email_address = ""
      @user.should_not be_valid
    end
    
    it "should return an error message" do
      @user.email_address = "bad"
      @user.valid?
      @user.errors[:email_address].should == ["is not a valid email address"]
    end
  end

end