# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.commentable, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      redirect_to @comment.commentable, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :commentable_type, :commentable_id)
  end
end
