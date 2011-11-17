class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to minutes_path
    end
  end

  def features
  end

  def pricing
  end

  def about
  end
end
