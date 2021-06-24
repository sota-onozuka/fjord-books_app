# frozen_string_literal: true

class CommentsController < ApplicationController
  def index; end

  def create
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @comment = @book.comments.new(comment_params)
    else
      @user = User.find(params[:user_id])
      @report = @user.reports.find(params[:report_id])
      @comment = @report.comments.new(comment_params)
    end
    @comment.user = User.find(current_user.id)
    rd = set_redirection_path
    respond_to do |format|
      if @comment.save
        format.html { redirect_to rd, notice: t('controllers.common.notice_create', name: Book.model_name.human) }
      else
        format.html { render :_form, comment: @comment }
      end
    end
  end

  def set_redirection_path
    if @book
      book_url(params[:book_id])
    else
      user_report_url(params[:user_id], params[:report_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
