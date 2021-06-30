# frozen_string_literal: true

class Books::CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comments = @book.comments.page(params[:page])
    @comment = @book.comments.new(comment_params)
    @comment.user = current_user
    rd = set_redirection_path
    respond_to do |format|
      if @comment.save
        format.html { redirect_to rd, notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        flash[:alert] = t('errors.messages.invald_creation')
        format.html { render "~/fjord-books_app/app/views/books/show.html.erb", comments: @comments}
      end
    end
  end

  def set_redirection_path
    book_url(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
