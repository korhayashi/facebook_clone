class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to entries_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :first_name, :email,
                                 :password, :birth_year, :birth_month,
                                 :birth_day, :gender)
  end
end
