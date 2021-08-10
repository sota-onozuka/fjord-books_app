# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = report.comments.new(comment_params)
    comment.user = current_user
    respond_to do |format|
      if comment.save
        format.html { redirect_to report_url(params[:report_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to report_url(params[:report_id]), notice: t('errors.messages.invald_creation') }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
