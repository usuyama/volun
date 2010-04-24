require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe AdminsController do
  fixtures :admins

  it 'allows signup' do
    lambda do
      create_admin
      response.should be_redirect
    end.should change(Admin, :count).by(1)
  end

  

  

  it 'requires login on signup' do
    lambda do
      create_admin(:login => nil)
      assigns[:admin].errors.on(:login).should_not be_nil
      response.should be_success
    end.should_not change(Admin, :count)
  end
  
  it 'requires password on signup' do
    lambda do
      create_admin(:password => nil)
      assigns[:admin].errors.on(:password).should_not be_nil
      response.should be_success
    end.should_not change(Admin, :count)
  end
  
  it 'requires password confirmation on signup' do
    lambda do
      create_admin(:password_confirmation => nil)
      assigns[:admin].errors.on(:password_confirmation).should_not be_nil
      response.should be_success
    end.should_not change(Admin, :count)
  end

  it 'requires email on signup' do
    lambda do
      create_admin(:email => nil)
      assigns[:admin].errors.on(:email).should_not be_nil
      response.should be_success
    end.should_not change(Admin, :count)
  end
  
  
  
  def create_admin(options = {})
    post :create, :admin => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire', :password_confirmation => 'quire' }.merge(options)
  end
end