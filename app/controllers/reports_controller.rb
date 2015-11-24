class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def by_address
    @service_requests = ServiceRequest.where("status != ?", 2) 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end

  def by_status
    @service_requests = ServiceRequest.where("status != ?", 2)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end

  def by_category
    @service_requests = ServiceRequest.where("status != ?", 2)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
  
  def closed_items
    if params[:search] && params[:page]
      @service_requests = ServiceRequest.where("status = ?", 2).search_by_address(params[:search], params[:page], 75, "ID")
    elsif !params[:search]
      @service_requests = ServiceRequest.where("status = ?", 2).search_by_address("", params[:page], 75, "ID")
    elsif !params[:page]
      @service_requests = ServiceRequest.where("status = ?", 2).search_by_address(params[:search], 1, 75, "ID")
    else
      @service_requests = ServiceRequest.where("status = ?", 2).search_by_address("", 1, 75, "ID")
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
  
  def closed_items_by_category
    if params[:search] && params[:page]
      @service_requests = ServiceRequest.where("status" => 2).search_by_category(params[:search], params[:page], 75, "ID")
    elsif !params[:search]
      @service_requests = ServiceRequest.where("status" => 2).search_by_category("", params[:page], 75, "ID")
    elsif !params[:page]
      @service_requests = ServiceRequest.where("status" => 2).search_by_category(params[:search], 1, 75, "ID")
    else
      @service_requests = ServiceRequest.where("status" => 2).search_by_category("", 1, 75, "ID")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
  
  def closed_items_by_status
    if params[:search] && params[:page]
      @service_requests = ServiceRequest.where("status" => 2).search_by_status(params[:search], params[:page], 75, "ID")
    elsif !params[:search]
      @service_requests = ServiceRequest.where("status" => 2).search_by_status("", params[:page], 75, "ID")
    elsif !params[:page]
      @service_requests = ServiceRequest.where("status" => 2).search_by_status(params[:search], 1, 75, "ID")
    else
      @service_requests = ServiceRequest.where("status" => 2).search_by_status("", 1, 75, "ID")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end
end
