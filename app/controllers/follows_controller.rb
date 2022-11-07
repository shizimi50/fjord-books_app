# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.active_follows.create(followed_id: params[:user_id])
    redirect_to request.referer || root_path
  end

  def destroy
    following = current_user.active_follows.find_by(followed_id: params[:user_id])
    following.destroy
    redirect_to request.referer || root_path
  end
end
