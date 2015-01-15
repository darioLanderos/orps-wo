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

  def by_status
    if ((params[:search]) && (params[:search] != "0"))
      @service_requests = ServiceRequest.find(:all, :conditions => ['status = ?', "#{params[:search]}"])
      @received_params = params[:search]
    else
      @service_requests = ServiceRequest.all
      @received_params = "Nothing received"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end

  def by_category
    
    if((params[:start_date]) && (params[:finish_date]))
      if ((params[:search])  && (params[:search] != "0"))
        @service_requests = ServiceRequest.find(:all, :conditions => ['category_id = ? AND created_at between ? and ?', "#{params[:search]}","#{params[:start_date]}" ,"#{params[:finish_date]}"])
        @received_params = params[:search]
      else
        @service_requests = ServiceRequest.find(:all, :conditions => ['created_at between ? and ?', "#{params[:start_date]}" ,"#{params[:finish_date]}"])
        @received_params = "Nothing received"
      end
    else
      @service_requests = ServiceRequest.all
      @received_params = "Nothing received"
    end
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
end
