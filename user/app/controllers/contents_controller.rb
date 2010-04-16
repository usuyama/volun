class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end
end
