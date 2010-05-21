class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Tag.get_contents(@tags)
  end

  def show
    @contents = Tag.find(params[:tag]).contents
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

