# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: :show
  def index
    @users = User.order(id: :desc).page(params[:page])
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :zipcode, :address, :profile, :password, :password_confirmation)
  end
end
