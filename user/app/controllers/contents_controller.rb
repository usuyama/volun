class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def preview
    @content = Content.find(params[:id])
  end

  def search
    @contents = Content.search params[:query]
  end

end
