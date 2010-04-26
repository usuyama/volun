require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe Customer do
  fixtures :customers

  describe 'being created' do
    before do
      @customer = nil
      @creating_customer = lambda do
        @customer = create_customer
        violated "#{@customer.errors.full_messages.to_sentence}" if @customer.new_record?
      end
    end
    
    it 'increments User#count' do
      @creating_customer.should change(Customer, :count).by(1)
    end
  end

  it 'requires login' do
    lambda do
      u = create_customer(:login => nil)
      u.errors.on(:login).should_not be_nil
    end.should_not change(Customer, :count)
  end

  it 'requires password' do
    lambda do
      u = create_customer(:password => nil)
      u.errors.on(:password).should_not be_nil
    end.should_not change(Customer, :count)
  end

  it 'requires password confirmation' do
    lambda do
      u = create_customer(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should_not be_nil
    end.should_not change(Customer, :count)
  end

  it 'requires email' do
    lambda do
      u = create_customer(:email => nil)
      u.errors.on(:email).should_not be_nil
    end.should_not change(Customer, :count)
  end

  it 'resets password' do
    customers(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    Customer.authenticate('quentin', 'new password').should == customers(:quentin)
  end

  it 'does not rehash password' do
    customers(:quentin).update_attributes(:login => 'quentin2')
    Customer.authenticate('quentin2', 'test').should == customers(:quentin)
  end

  it 'authenticates customer' do
    Customer.authenticate('quentin', 'test').should == customers(:quentin)
  end

  it 'sets remember token' do
    customers(:quentin).remember_me
    customers(:quentin).remember_token.should_not be_nil
    customers(:quentin).remember_token_expires_at.should_not be_nil
  end

  it 'unsets remember token' do
    customers(:quentin).remember_me
    customers(:quentin).remember_token.should_not be_nil
    customers(:quentin).forget_me
    customers(:quentin).remember_token.should be_nil
  end

  it 'remembers me for one week' do
    before = 1.week.from_now.utc
    customers(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    customers(:quentin).remember_token.should_not be_nil
    customers(:quentin).remember_token_expires_at.should_not be_nil
    customers(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'remembers me until one week' do
    time = 1.week.from_now.utc
    customers(:quentin).remember_me_until time
    customers(:quentin).remember_token.should_not be_nil
    customers(:quentin).remember_token_expires_at.should_not be_nil
    customers(:quentin).remember_token_expires_at.should == time
  end

  it 'remembers me default two weeks' do
    before = 2.weeks.from_now.utc
    customers(:quentin).remember_me
    after = 2.weeks.from_now.utc
    customers(:quentin).remember_token.should_not be_nil
    customers(:quentin).remember_token_expires_at.should_not be_nil
    customers(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

protected
  def create_customer(options = {})
    record = Customer.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    record.save
    record
  end
end
