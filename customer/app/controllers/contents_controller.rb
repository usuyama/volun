class ContentsController < ApplicationController
  before_filter :login_required
  before_filter :user_checked
  # GET /contents
  # GET /contents.xml
  def index
    @contents = current_customer.contents

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    @content =current_customer.contents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.xml
  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = current_customer.contents.find(params[:id])
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if current_customer.contents << @content
        flash[:notice] = 'コンテンツの作成が完了しました。'
        format.html { redirect_to([current_customer,@content]) }
        format.xml  { render :xml => @content, :status => :created, :location =>[current_customer @content] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    @content = current_customer.contents.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content].merge(:customer_id => current_customer.id))
        flash[:notice] = 'コンテンツの更新が完了しました'
        format.html { redirect_to([current_customer,@content]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    @content = current_customer.contents.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to(customer_contents_url) }
      format.xml  { head :ok }
    end
  end

private

  def user_checked
    unless params[:customer_id].to_i == current_customer.id
      redirect_to customer_contents_path(current_customer)
      flash[:alert] = "アクセスに失敗しました"
      end
  end
end
