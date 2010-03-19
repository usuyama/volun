require 'spec_helper'

describe ContentsController do

  def mock_content(stubs={})
    @mock_content ||= mock_model(Content, stubs)
  end

  describe "GET index" do
    it "assigns all contents as @contents" do
      Content.stub(:find).with(:all).and_return([mock_content])
      get :index
      assigns[:contents].should == [mock_content]
    end
  end

  describe "GET show" do
    it "assigns the requested content as @content" do
      Content.stub(:find).with("37").and_return(mock_content)
      get :show, :id => "37"
      assigns[:content].should equal(mock_content)
    end
  end

  describe "GET new" do
    it "assigns a new content as @content" do
      Content.stub(:new).and_return(mock_content)
      get :new
      assigns[:content].should equal(mock_content)
    end
  end

  describe "GET edit" do
    it "assigns the requested content as @content" do
      Content.stub(:find).with("37").and_return(mock_content)
      get :edit, :id => "37"
      assigns[:content].should equal(mock_content)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created content as @content" do
        Content.stub(:new).with({'these' => 'params'}).and_return(mock_content(:save => true))
        post :create, :content => {:these => 'params'}
        assigns[:content].should equal(mock_content)
      end

      it "redirects to the created content" do
        Content.stub(:new).and_return(mock_content(:save => true))
        post :create, :content => {}
        response.should redirect_to(content_url(mock_content))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved content as @content" do
        Content.stub(:new).with({'these' => 'params'}).and_return(mock_content(:save => false))
        post :create, :content => {:these => 'params'}
        assigns[:content].should equal(mock_content)
      end

      it "re-renders the 'new' template" do
        Content.stub(:new).and_return(mock_content(:save => false))
        post :create, :content => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested content" do
        Content.should_receive(:find).with("37").and_return(mock_content)
        mock_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :content => {:these => 'params'}
      end

      it "assigns the requested content as @content" do
        Content.stub(:find).and_return(mock_content(:update_attributes => true))
        put :update, :id => "1"
        assigns[:content].should equal(mock_content)
      end

      it "redirects to the content" do
        Content.stub(:find).and_return(mock_content(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(content_url(mock_content))
      end
    end

    describe "with invalid params" do
      it "updates the requested content" do
        Content.should_receive(:find).with("37").and_return(mock_content)
        mock_content.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :content => {:these => 'params'}
      end

      it "assigns the content as @content" do
        Content.stub(:find).and_return(mock_content(:update_attributes => false))
        put :update, :id => "1"
        assigns[:content].should equal(mock_content)
      end

      it "re-renders the 'edit' template" do
        Content.stub(:find).and_return(mock_content(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested content" do
      Content.should_receive(:find).with("37").and_return(mock_content)
      mock_content.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the contents list" do
      Content.stub(:find).and_return(mock_content(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(contents_url)
    end
  end

end
