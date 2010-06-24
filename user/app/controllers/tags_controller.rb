class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Content.displayable.intime.in_tag(@tags).flatten.uniq
    # @contents_size1 =Content.displayable.intime.in_tag(@tags).banner_size(1).uniq.flatten
    # @contents_size2 =Content.displayable.intime.in_tag(@tags).banner_size(2).uniq.flatten 

    while @contents.count % 6 != 0 
      @randcontent = Content.displayable.intime.in_tag(@tags).rand  
      if @randcontent != @contents.last && @randcontent != @contents[@contents.size - 3] then
        @contents << @randcontent
      end
    end
 #   while @contents_size2.nil?
 #     @contents << @contents_size2.shift
 #     while @contents.count % 5!= 0
 #       if @randcontent != @contents.last && @randcontent != @contents[@contents.size - 3] then
 #         @contents << @randcontent 
 #       end
 #   end 
  end

  def show
    @contents = Content.displayable.intime.in_tag(params[:tag]).flatten.uniq
    while @contents.count % 6 != 0
      @randcontent = Content.displayable.intime.in_tag(params[:tag]).rand  
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

