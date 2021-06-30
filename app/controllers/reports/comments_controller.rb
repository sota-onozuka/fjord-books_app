# frozen_string_literal: true

class Reports::CommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @comments = @report.comments.page(params[:page])
    @comment = @report.comments.new(comment_params)
    @comment.user = current_user
    rd = set_redirection_path
    respond_to do |format|
      if @comment.save
        format.html { redirect_to rd, notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        flash[:alert] = t('errors.messages.invald_creation')
        format.html { render "~/fjord-books_app/app/views/reports/show.html.erb", comments: @comments}
      end
    end
  end

  def set_redirection_path
    report_url(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
