class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @contents = Tag.get_contents(@tags)
    while @contents.count % 3 != 0
      @contents << Content.all.rand
    end
  end

  def show
    @contents = Tag.find(params[:tag]).contents
    while @contents.count % 3 != 0
      @contents << Content.all.rand
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end

