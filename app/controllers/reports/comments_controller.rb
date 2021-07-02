# frozen_string_literal: true

class Reports::CommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @comments = @report.comments.page(params[:page])
    @comment = @report.comments.new(comment_params)
    @comment.user = current_user
    rd = report_url(params[:report_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to rd, notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to rd, notice: t('errors.messages.invald_creation') }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
