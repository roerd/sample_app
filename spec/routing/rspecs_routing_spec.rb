require "spec_helper"

describe RspecsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/rspecs" }.should route_to(:controller => "rspecs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/rspecs/new" }.should route_to(:controller => "rspecs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/rspecs/1" }.should route_to(:controller => "rspecs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/rspecs/1/edit" }.should route_to(:controller => "rspecs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/rspecs" }.should route_to(:controller => "rspecs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/rspecs/1" }.should route_to(:controller => "rspecs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/rspecs/1" }.should route_to(:controller => "rspecs", :action => "destroy", :id => "1")
    end

  end
end
