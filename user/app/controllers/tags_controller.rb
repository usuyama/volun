class TagsController < ApplicationController
  def index
    @tags = Tag.all
    if params[:id]
      @contents = Tag.find(params[:id]).contents
    else
      @contents = Tag.get_contents(@tags)
    end
  end

  def show
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end

