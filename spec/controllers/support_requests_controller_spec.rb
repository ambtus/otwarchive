require 'spec_helper'

describe SupportRequestsController do
  describe "GET area" do
    before(:each) do
      get 'area'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should render area" do
      response.should render_template("area")
    end
  end
  describe "GET new" do
    before(:each) do
      get 'new'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should render new" do
      response.should render_template("new")
    end
  end
  describe "GET index" do
    before(:each) do
      get 'index'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should render index" do
      response.should render_template("index")
    end
  end
  describe "GET known" do
    before(:each) do
      get 'known'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should render known" do
      response.should render_template("known")
    end
  end
end
