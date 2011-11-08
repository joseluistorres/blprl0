class PagesController < ApplicationController
  def home
    @user_session = UserSession.new
  end

  def features
  end

  def pricing
  end

  def about
  end
end
