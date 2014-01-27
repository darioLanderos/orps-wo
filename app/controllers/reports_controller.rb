class ReportsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def by_address
    if params[:search]
      @service_requests = ServiceRequest.find(:all, :conditions => ['address LIKE ?', "%#{params[:search]}%"])
    else
      @service_requests = ServiceRequest.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
end
