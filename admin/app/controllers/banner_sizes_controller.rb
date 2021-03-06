class BannerSizesController < ApplicationController
  before_filter :login_required
  # GET /banner_size
  def index
    @banner_sizes = BannerSize.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banner_sizes }
    end
  end
  
  # GET /banner_sizes/1
  # GET /banner_sizes/1.xml
  def show
    @banner_size = BannerSize.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner_size }
    end
  end
  
  # GET /banner_sizes/new
  # GET /banner_sizes/new.xml
  def new
    @banner_size = BannerSize.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner_size }
    end
  end
  
  # GET /banner_sizes/1/edit
  def edit
    @banner_size = BannerSize.find(params[:id])
  end
  
  # POST /banner_sizes
  # POST /banner_sizes.xml
  def create
    @banner_size = BannerSize.new(params[:banner_size])
    
    respond_to do |format|
      if @banner_size.save
        flash[:notice] = 'BannerSize was successfully created.'
        format.html { redirect_to(@banner_size) }
        format.xml  { render :xml => @banner_size, :status => :created, :location => @banner_size }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner_size.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /banner_sizes/1
  # PUT /banner_sizes/1.xml
  def update
    @banner_size = BannerSize.find(params[:id])
    
    respond_to do |format|
      if @banner_size.update_attributes(params[:banner_size])
        flash[:notice] = 'BannerSize was successfully updated.'
        format.html { redirect_to(@banner_size) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner_size.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /banner_sizes/1
  # DELETE /banner_sizes/1.xml
  def destroy
    @banner_size = BannerSize.find(params[:id])
    @banner_size.destroy
    
    respond_to do |format|
      format.html { redirect_to(banner_sizes_url) }
      format.xml  { head :ok }
    end
    
    
  end
end
