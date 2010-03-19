class ContentImagesController < ApplicationController
  # GET /content_images
  # GET /content_images.xml
  def index
    @content_images = ContentImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_images }
    end
  end

  # GET /content_images/1
  # GET /content_images/1.xml
  def show
    @content_image = ContentImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_image }
    end
  end

  # GET /content_images/new
  # GET /content_images/new.xml
  def new
    @content_image = ContentImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_image }
    end
  end

  # GET /content_images/1/edit
  def edit
    @content_image = ContentImage.find(params[:id])
  end

  # POST /content_images
  # POST /content_images.xml
  def create
    @content_image = ContentImage.new(params[:content_image])

    respond_to do |format|
      if @content_image.save
        flash[:notice] = 'ContentImage was successfully created.'
        format.html { redirect_to(@content_image) }
        format.xml  { render :xml => @content_image, :status => :created, :location => @content_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_images/1
  # PUT /content_images/1.xml
  def update
    @content_image = ContentImage.find(params[:id])

    respond_to do |format|
      if @content_image.update_attributes(params[:content_image])
        flash[:notice] = 'ContentImage was successfully updated.'
        format.html { redirect_to(@content_image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_images/1
  # DELETE /content_images/1.xml
  def destroy
    @content_image = ContentImage.find(params[:id])
    @content_image.destroy

    respond_to do |format|
      format.html { redirect_to(content_images_url) }
      format.xml  { head :ok }
    end
  end
end
