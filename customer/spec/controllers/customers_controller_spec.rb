require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe CustomersController do
  fixtures :customers

  it 'allows signup' do
    lambda do
      create_customer
      response.should be_redirect
    end.should change(Customer, :count).by(1)
  end

  

  

  it 'requires login on signup' do
    lambda do
      create_customer(:login => nil)
      assigns[:customer].errors.on(:login).should_not be_nil
      response.should be_success
    end.should_not change(Customer, :count)
  end
  
  it 'requires password on signup' do
    lambda do
      create_customer(:password => nil)
      assigns[:customer].errors.on(:password).should_not be_nil
      response.should be_success
    end.should_not change(Customer, :count)
  end
  
  it 'requires password confirmation on signup' do
    lambda do
      create_customer(:password_confirmation => nil)
      assigns[:customer].errors.on(:password_confirmation).should_not be_nil
      response.should be_success
    end.should_not change(Customer, :count)
  end

  it 'requires email on signup' do
    lambda do
      create_customer(:email => nil)
      assigns[:customer].errors.on(:email).should_not be_nil
      response.should be_success
    end.should_not change(Customer, :count)
  end
  
  
  
  def create_customer(options = {})
    post :create, :customer => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire', :password_confirmation => 'quire' }.merge(options)
  end
end