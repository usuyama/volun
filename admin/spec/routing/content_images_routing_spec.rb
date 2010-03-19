require 'spec_helper'

describe ContentImagesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/content_images" }.should route_to(:controller => "content_images", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/content_images/new" }.should route_to(:controller => "content_images", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/content_images/1" }.should route_to(:controller => "content_images", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/content_images/1/edit" }.should route_to(:controller => "content_images", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/content_images" }.should route_to(:controller => "content_images", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/content_images/1" }.should route_to(:controller => "content_images", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/content_images/1" }.should route_to(:controller => "content_images", :action => "destroy", :id => "1") 
    end
  end
end
