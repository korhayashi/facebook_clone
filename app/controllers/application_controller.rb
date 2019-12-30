class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, EntriesHelper

  def authenticate_user
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def wrong_member
    if current_user.id != @user.id
      redirect_to user_path(@user.id)
    end
  end

  def logged_in_member
    if logged_in?
      redirect_to entries_path
    end
  end

  def wrong_posted_by
    if current_user.id != @entry.user_id
      redirect_to entries_path
    end
  end
end
