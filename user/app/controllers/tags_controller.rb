class TagsController < ApplicationController
  def index
    if params[:tag]
      @tags = [Tag.find(params[:tag])]
    else
      @tags = Tag.all
    end
    @contents = Tag.get_contents(@tags)
  end

  def show
    params[:tag] = params[:id]
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end

