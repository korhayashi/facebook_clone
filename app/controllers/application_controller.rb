class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, EntriesHelper

  def authenticate_user
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def logged_in_member
    if logged_in?
      redirect_to entries_path
    end
  end
end
