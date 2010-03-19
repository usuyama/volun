require 'spec_helper'

describe AdminsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admins" }.should route_to(:controller => "admins", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admins/new" }.should route_to(:controller => "admins", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admins/1" }.should route_to(:controller => "admins", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admins/1/edit" }.should route_to(:controller => "admins", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admins" }.should route_to(:controller => "admins", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admins/1" }.should route_to(:controller => "admins", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admins/1" }.should route_to(:controller => "admins", :action => "destroy", :id => "1") 
    end
  end
end
