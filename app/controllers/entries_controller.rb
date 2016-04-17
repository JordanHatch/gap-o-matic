class EntriesController < ApplicationController
  def index
    redirect_to dashboard_path(dashboard)
  end

  def new
  end

  def create
    entry.assign_attributes(entry_params)

    if entry.save
      flash.notice = 'Entry created'
      redirect_to dashboard_path(dashboard)
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if entry.update_attributes(entry_params)
      flash.notice = 'Entry saved'
      redirect_to dashboard_path(dashboard)
    else
      render action: :edit
    end
  end

  def destroy
    entry.soft_delete!
    flash.notice = 'Entry deleted'
    redirect_to dashboard_path(dashboard)
  end

private
  def dashboard
    @dashboard ||= Dashboard.find(params[:dashboard_id])
  end
  helper_method :dashboard

  def entry
    if params.key?(:id)
      @entry ||= dashboard.entries.find(params[:id])
    else
      @entry ||= dashboard.entries.build
    end
  end
  helper_method :entry

  def entry_params
    params.require(:entry).permit(:title, :description, :percent, :order)
  end

end
