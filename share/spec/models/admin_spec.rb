require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe Admin do
  fixtures :admins

  describe 'being created' do
    before do
      @admin = nil
      @creating_admin = lambda do
        @admin = create_admin
        violated "#{@admin.errors.full_messages.to_sentence}" if @admin.new_record?
      end
    end
    
    it 'increments User#count' do
      @creating_admin.should change(Admin, :count).by(1)
    end
  end

  it 'requires login' do
    lambda do
      u = create_admin(:login => nil)
      u.errors.on(:login).should_not be_nil
    end.should_not change(Admin, :count)
  end

  it 'requires password' do
    lambda do
      u = create_admin(:password => nil)
      u.errors.on(:password).should_not be_nil
    end.should_not change(Admin, :count)
  end

  it 'requires password confirmation' do
    lambda do
      u = create_admin(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should_not be_nil
    end.should_not change(Admin, :count)
  end

  it 'requires email' do
    lambda do
      u = create_admin(:email => nil)
      u.errors.on(:email).should_not be_nil
    end.should_not change(Admin, :count)
  end

  it 'resets password' do
    admins(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    Admin.authenticate('quentin', 'new password').should == admins(:quentin)
  end

  it 'does not rehash password' do
    admins(:quentin).update_attributes(:login => 'quentin2')
    Admin.authenticate('quentin2', 'test').should == admins(:quentin)
  end

  it 'authenticates admin' do
    Admin.authenticate('quentin', 'test').should == admins(:quentin)
  end

  it 'sets remember token' do
    admins(:quentin).remember_me
    admins(:quentin).remember_token.should_not be_nil
    admins(:quentin).remember_token_expires_at.should_not be_nil
  end

  it 'unsets remember token' do
    admins(:quentin).remember_me
    admins(:quentin).remember_token.should_not be_nil
    admins(:quentin).forget_me
    admins(:quentin).remember_token.should be_nil
  end

  it 'remembers me for one week' do
    before = 1.week.from_now.utc
    admins(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    admins(:quentin).remember_token.should_not be_nil
    admins(:quentin).remember_token_expires_at.should_not be_nil
    admins(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'remembers me until one week' do
    time = 1.week.from_now.utc
    admins(:quentin).remember_me_until time
    admins(:quentin).remember_token.should_not be_nil
    admins(:quentin).remember_token_expires_at.should_not be_nil
    admins(:quentin).remember_token_expires_at.should == time
  end

  it 'remembers me default two weeks' do
    before = 2.weeks.from_now.utc
    admins(:quentin).remember_me
    after = 2.weeks.from_now.utc
    admins(:quentin).remember_token.should_not be_nil
    admins(:quentin).remember_token_expires_at.should_not be_nil
    admins(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

protected
  def create_admin(options = {})
    record = Admin.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    record.save
    record
  end
end
