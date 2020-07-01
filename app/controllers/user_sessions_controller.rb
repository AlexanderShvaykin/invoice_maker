# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def create
    if login(params.require(:email), params.require(:password))
      redirect_to :root
    else
      flash[:alert] = t("login.error")
      render :new
    end
  end

  def new; end

  def destroy
    logout
    redirect_to :root
  end
end
