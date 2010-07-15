class ContactsController < ApplicationController

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new(params[:contact])
    unless current_user.nil?
      @contact.user = current_user
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Successfully sent message'
        ContactMailer.deliver_contact(@contact)
        format.html { render :action => "show" }
      else
        flash[:notice] = 'Failed to send message.'
        format.html { render :action => "new" }
      end
    end
  end

  def show
  end

end
