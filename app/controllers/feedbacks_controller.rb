class FeedbacksController < ApplicationController
  before_filter :authenticate_user!
  def index
    if params[:id]
      @user = User.find(current_user.id)
      @user.increment!(:changefiltertag)
    end
  end

end
