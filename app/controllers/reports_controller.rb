# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: :show
  before_action :set_permitted_report, only: %i[edit update destroy]

  def index
    @reports = Report.preload(:user).all
  end

  def show
    @comments = @report.comments
    @comment = Comment.new
  end

  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to report_path(@report), notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = Report.preload(:user).find(params[:id])
  end

  def set_permitted_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :description)
  end
end
