require 'spec_helper'

describe Admin::SupportSettingsController do
  describe "GET index" do
    it "should not be successful when logged out" do
      get 'index'
      response.should be_redirect
    end
    it "should not be successful when logged in as user" do
      controller.stub!(:users_only).and_return(true)
      get 'index'
      response.should be_redirect
    end
    it "should be successful when logged in as admin" do
      controller.stub!(:admin_only).and_return(true)
      get 'index'
      response.should be_success
    end
    it "should render index when logged in as admin" do
      controller.stub!(:admin_only).and_return(true)
      get 'index'
      response.should render_template("index")
    end
  end
end
