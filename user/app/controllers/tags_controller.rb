class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Tag.get_contents(@tags)
  end

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @contents = @tag.contents
  end
end

