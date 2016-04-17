class DashboardsController < ApplicationController

  def index
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "dashboard-#{Time.now.to_i}",
               show_as_html: params.key?('debug')
      end
    end
  end

  def new
  end

  def create
    dashboard.assign_attributes(dashboard_params)

    if dashboard.save
      flash.notice = 'Dashboard created'
      redirect_to dashboard_path(dashboard)
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if dashboard.update_attributes(dashboard_params)
      flash.notice = 'Dashboard saved'
      redirect_to dashboard_path(dashboard)
    else
      render action: :edit
    end
  end

private
  def dashboards
    @dashboards ||= Dashboard.all
  end
  helper_method :dashboards

  def dashboard
    if params.key?(:id)
      @dashboard ||= Dashboard.find(params[:id])
    else
      @dashboard ||= Dashboard.new
    end
  end
  helper_method :dashboard

  def entries
    dashboard.entries
  end
  helper_method :entries

  def dashboard_params
    params.require(:dashboard).permit(:title)
  end

end
