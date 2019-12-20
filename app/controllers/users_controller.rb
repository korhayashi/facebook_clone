class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user, only: [:show]
  before_action :logged_in_member, except: [:show]

  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render 'new' if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render 'new'
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to entries_path
      else
        render 'new'
      end
    end
  end

  def show
    @entry = Entry.new
    @all_entry = Entry.all
    @image_entries = @all_entry.where(user_id: @user.id).where.not(image: '').order(created_at: :desc)
    @entries = @all_entry.where(user_id: @user.id).where(parent_entry_id: nil).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :first_name, :email,
                                 :password, :birth_year, :birth_month,
                                 :birth_day, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
