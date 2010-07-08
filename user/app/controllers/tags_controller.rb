class TagsController < ApplicationController
  include Tiling
  def index
    @tags = Tag.all
    contents_size1 =Content.displayable.intime.in_tag(@tags).banner_size(1).flatten.uniq 
    contents_size2 =Content.displayable.intime.in_tag(@tags).banner_size(2).flatten.uniq 
    array_merge(contents_size1,contents_size2)
  end


  def show
    @tags = params[:tag]
    contents_size1 =Content.displayable.intime.in_tag(@tags).banner_size(1).flatten.uniq 
    contents_size2 =Content.displayable.intime.in_tag(@tags).banner_size(2).flatten.uniq 
    array_merge(contents_size1,contents_size2)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

