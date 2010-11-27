require 'spec_helper'

describe RspecsController do

  def mock_rspec(stubs={})
    (@mock_rspec ||= mock_model(Rspec).as_null_object).tap do |rspec|
      rspec.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all rspecs as @rspecs" do
      Rspec.stub(:all) { [mock_rspec] }
      get :index
      assigns(:rspecs).should eq([mock_rspec])
    end
  end

  describe "GET show" do
    it "assigns the requested rspec as @rspec" do
      Rspec.stub(:find).with("37") { mock_rspec }
      get :show, :id => "37"
      assigns(:rspec).should be(mock_rspec)
    end
  end

  describe "GET new" do
    it "assigns a new rspec as @rspec" do
      Rspec.stub(:new) { mock_rspec }
      get :new
      assigns(:rspec).should be(mock_rspec)
    end
  end

  describe "GET edit" do
    it "assigns the requested rspec as @rspec" do
      Rspec.stub(:find).with("37") { mock_rspec }
      get :edit, :id => "37"
      assigns(:rspec).should be(mock_rspec)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created rspec as @rspec" do
        Rspec.stub(:new).with({'these' => 'params'}) { mock_rspec(:save => true) }
        post :create, :rspec => {'these' => 'params'}
        assigns(:rspec).should be(mock_rspec)
      end

      it "redirects to the created rspec" do
        Rspec.stub(:new) { mock_rspec(:save => true) }
        post :create, :rspec => {}
        response.should redirect_to(rspec_url(mock_rspec))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rspec as @rspec" do
        Rspec.stub(:new).with({'these' => 'params'}) { mock_rspec(:save => false) }
        post :create, :rspec => {'these' => 'params'}
        assigns(:rspec).should be(mock_rspec)
      end

      it "re-renders the 'new' template" do
        Rspec.stub(:new) { mock_rspec(:save => false) }
        post :create, :rspec => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested rspec" do
        Rspec.should_receive(:find).with("37") { mock_rspec }
        mock_rspec.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rspec => {'these' => 'params'}
      end

      it "assigns the requested rspec as @rspec" do
        Rspec.stub(:find) { mock_rspec(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:rspec).should be(mock_rspec)
      end

      it "redirects to the rspec" do
        Rspec.stub(:find) { mock_rspec(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(rspec_url(mock_rspec))
      end
    end

    describe "with invalid params" do
      it "assigns the rspec as @rspec" do
        Rspec.stub(:find) { mock_rspec(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:rspec).should be(mock_rspec)
      end

      it "re-renders the 'edit' template" do
        Rspec.stub(:find) { mock_rspec(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested rspec" do
      Rspec.should_receive(:find).with("37") { mock_rspec }
      mock_rspec.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rspecs list" do
      Rspec.stub(:find) { mock_rspec }
      delete :destroy, :id => "1"
      response.should redirect_to(rspecs_url)
    end
  end

end
