class ServiceRequestsController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /service_requests
  # GET /service_requests.json
  def index
    @service_requests = ServiceRequest.all(:order => 'updated_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_requests }
    end
  end

  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
    @service_request = ServiceRequest.find(params[:id])
    @the_creator = User.find_by_id(@service_request.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service_request }
    end
  end

  # GET /service_requests/new
  # GET /service_requests/new.json
  def new
    @service_request = ServiceRequest.new
    @service_request.warning_date = Date.tomorrow
    @service_request.alert_date = Date.tomorrow + 1
    @categories = Category.all(:order => 'name DESC')
    @service_request.category = @categories.first

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service_request }
    end
  end

  # GET /service_requests/1/edit
  def edit
    @service_request = ServiceRequest.find(params[:id])
    @categories = Category.all(:order => 'name DESC')
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(params[:service_request])
    @service_request.status = 1; # 1 = Open
    @service_request.user_id = current_user.id
    
    respond_to do |format|
      if @service_request.save
        format.html { redirect_to @service_request, notice: 'Service request was successfully created.' }
        format.json { render json: @service_request, status: :created, location: @service_request }
      else
        format.html { render action: "new" }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /service_requests/1
  # PUT /service_requests/1.json
  def update
    @service_request = ServiceRequest.find(params[:id])

    respond_to do |format|
      if @service_request.update_attributes(params[:service_request])
        format.html { redirect_to @service_request, notice: 'Service request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    @service_request = ServiceRequest.find(params[:id])
    @service_request.destroy

    respond_to do |format|
      format.html { redirect_to service_requests_url }
      format.json { head :no_content }
    end
  end
end
