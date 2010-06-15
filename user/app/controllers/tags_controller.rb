class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Content.display.display_permit.in_tag(@tags).flatten.uniq
    while @contents.count % 6 != 0 
      @randcontent = Content.display.display_permit.rand  
      if @randcontent != @contents.last && @randcontent != @contents[@contents.size - 3] then
        @contents << @randcontent
      end
    end
  end

  def show
    @contents = Content.display.display_permit.in_tag(params[:tag]).flatten.uniq
    while @contents.count % 6 != 0
      @randcontent = Content.display.display_permit.rand  
      if @randcontent != @contents.last && @randcontent != @contents[@contents.size - 3] then
        @contents << @randcontent
      end
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

