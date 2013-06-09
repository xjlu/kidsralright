class KsrcommentsController < ApplicationController
  respond_to :json

  def index
    respond_with context.ksrcomments
  end

  def show
    respond_with context.comment_for params[:date]
  end

  def create
    comment = context.ksrcomments.create!(
      :user => current_user,
      :comment => params[:comment],
      :date_of_comment => params[:date_of_comment]
    )
    respond_with comment
  end

  def update
    comment = Ksrcomment.find(params[:id])
    comment.update_attributes(
      :comment => params[:comment]
    )

    respond_with comment
  end

  def destroy
    res = Ksrcomment.find(params[:id]).destroy
    respond_with res
  end

  private ######### private methods ###########

  def context
    if params[:user_id]
      User.find(params[:user_id])
    elsif params[:classroom_id]
      Classroom.find(params[:classroom_id])
    else
      raise ActiveRecord::RecordNotFound, "Comment context is required"
    end
  end
end