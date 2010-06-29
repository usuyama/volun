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

  def mark_as_favorite
    @content = Content.find(params[:content][:id])
    @user = current_user
    unless @user.nil? && !@content.is_favorite_of?(@user)
      @user.contents << @content
      @user.save
    end
    redirect_to @content
  end

  def unmark_as_favorite
    @content = Content.find(params[:content][:id])
    @user = current_user
    unless @user.nil? && @content.is_favorite_of?(@user)
      @user.contents.delete @content
      @user.save
    end
    redirect_to @content
  end

end
