require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    #it "should have the right title" do
    #  get 'home'
    #  response.should have_selector("title",
    #                      :content => "Ruby on Rails Tutorial Sample App | Home")
    #end
  end

  describe "GET 'features'" do
    it "should be successful" do
      get 'features'
      response.should be_success
    end
  end

  describe "GET 'pricing'" do
    it "should be successful" do
      get 'pricing'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
  
end
