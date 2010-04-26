class AdminsController < ApplicationController
before_filter :login_required ,:except => [:new,:create]
  # Be sure to include AuthenticationSystem in Application Controller instead
 # include AuthenticatedSystem
  

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @admin = Admin.new(params[:admin])
    @admin.save
    if @admin.errors.empty?
      self.current_admin = @admin
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
