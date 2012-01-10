class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def features
  end

  def pricing
  end

  def about
  end
  
  def register
    if !params[:email].blank?
      @register = Register.create!(:email => params[:email])
      UserMailer.registration_notification(@register).deliver
    end
  end
end
