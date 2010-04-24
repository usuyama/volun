class CustomersController < ApplicationController
  before_filter :login_required ,:except => [:new,:create]

   def index
     
   end
   def show
     @customer =Customer.find(params[:id])
     
     respond_to do |format|
       format.html
       format.xml { render :xml => @customer }
     end
   end
  # render new.rhtml
  def new
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @customer = Customer.new(params[:customer])
    @customer.save
    if @customer.errors.empty?
      self.current_customer = @customer
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Customer was successfully updated.'
        format.html { redirect_to(current_customer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
end
