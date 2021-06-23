class CommentsController < ApplicationController
  def index
  end

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
    if @book
      rd = book_url(params[:book_id])
    else
      rd = user_report_url(params[:user_id], params[:report_id])
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to rd, notice: t('controllers.common.notice_create', name: Book.model_name.human) }
      else
        #format.html { render :_form, comment: @comment }
        raise
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
