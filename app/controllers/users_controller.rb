class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      email: params.require(:email),
      password: params.require(:password)
    )

    if @user.save && auto_login(@user)
      redirect_to :root
    else
      render :new
    end
  end
end
