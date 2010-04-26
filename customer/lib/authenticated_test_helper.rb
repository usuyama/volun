module AuthenticatedTestHelper
  # Sets the current customer in the session from the customer fixtures.
  def login_as(customer)
    @request.session[:customer_id] = customer ? customers(customer).id : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
