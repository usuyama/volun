class ContactsController < ApplicationController
  before_filter :login_required
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.find_all_by_customer_id(current_customer.id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    if !@contact.nil? && @contact.customer == current_customer
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @contact }
      end
    else
      redirect_to :action => :index
    end
  end

end
