require 'spec_helper'

describe ContentImagesController do

  def mock_content_image(stubs={})
    @mock_content_image ||= mock_model(ContentImage, stubs)
  end

  describe "GET index" do
    it "assigns all content_images as @content_images" do
      ContentImage.stub(:find).with(:all).and_return([mock_content_image])
      get :index
      assigns[:content_images].should == [mock_content_image]
    end
  end

  describe "GET show" do
    it "assigns the requested content_image as @content_image" do
      ContentImage.stub(:find).with("37").and_return(mock_content_image)
      get :show, :id => "37"
      assigns[:content_image].should equal(mock_content_image)
    end
  end

  describe "GET new" do
    it "assigns a new content_image as @content_image" do
      ContentImage.stub(:new).and_return(mock_content_image)
      get :new
      assigns[:content_image].should equal(mock_content_image)
    end
  end

  describe "GET edit" do
    it "assigns the requested content_image as @content_image" do
      ContentImage.stub(:find).with("37").and_return(mock_content_image)
      get :edit, :id => "37"
      assigns[:content_image].should equal(mock_content_image)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created content_image as @content_image" do
        ContentImage.stub(:new).with({'these' => 'params'}).and_return(mock_content_image(:save => true))
        post :create, :content_image => {:these => 'params'}
        assigns[:content_image].should equal(mock_content_image)
      end

      it "redirects to the created content_image" do
        ContentImage.stub(:new).and_return(mock_content_image(:save => true))
        post :create, :content_image => {}
        response.should redirect_to(content_image_url(mock_content_image))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved content_image as @content_image" do
        ContentImage.stub(:new).with({'these' => 'params'}).and_return(mock_content_image(:save => false))
        post :create, :content_image => {:these => 'params'}
        assigns[:content_image].should equal(mock_content_image)
      end

      it "re-renders the 'new' template" do
        ContentImage.stub(:new).and_return(mock_content_image(:save => false))
        post :create, :content_image => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested content_image" do
        ContentImage.should_receive(:find).with("37").and_return(mock_content_image)
        mock_content_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :content_image => {:these => 'params'}
      end

      it "assigns the requested content_image as @content_image" do
        ContentImage.stub(:find).and_return(mock_content_image(:update_attributes => true))
        put :update, :id => "1"
        assigns[:content_image].should equal(mock_content_image)
      end

      it "redirects to the content_image" do
        ContentImage.stub(:find).and_return(mock_content_image(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(content_image_url(mock_content_image))
      end
    end

    describe "with invalid params" do
      it "updates the requested content_image" do
        ContentImage.should_receive(:find).with("37").and_return(mock_content_image)
        mock_content_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :content_image => {:these => 'params'}
      end

      it "assigns the content_image as @content_image" do
        ContentImage.stub(:find).and_return(mock_content_image(:update_attributes => false))
        put :update, :id => "1"
        assigns[:content_image].should equal(mock_content_image)
      end

      it "re-renders the 'edit' template" do
        ContentImage.stub(:find).and_return(mock_content_image(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested content_image" do
      ContentImage.should_receive(:find).with("37").and_return(mock_content_image)
      mock_content_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the content_images list" do
      ContentImage.stub(:find).and_return(mock_content_image(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(content_images_url)
    end
  end

end
