class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Content.display.display_permit.in_tag(@tags)
    while @contents && (@contents.count % 3 != 0)
      @contents << Content.all.rand
    end
  end

  def show
    @contents = Content.display.display_permit.in_tag(params[:tag])
    while @contents.count % 3 != 0
      @contents << Content.all.rand
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

