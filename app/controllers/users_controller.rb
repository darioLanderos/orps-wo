class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
     @users = User.all 
    #@users = User.accessible_by(current_ability)
    #authorize! :index, User
  end
  
  # GET /users/new
  def new
      #@user = User.new
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
  end
  # GET /users/1/edit
  def edit
    #@allowed_roles = Role.accessible_by(current_ability)
  end
  
  # POST /users
  # POST /users.json
  def create
    #@role = Role.new(role_params)
    #@user = User.new(user_params)
    #@user.unconfirmed_email = @user.email
    #@user.skip_confirmation!
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    # IF user is setting a new password user regular update, if not then update without password.
    successfully_updated = if needs_password?(@user, user_params)
                             #@user.skip_reconfirmation!
                             @user.update_attributes(user_params)
                           else
                             #@user.skip_reconfirmation!
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  end
  
  protected
  def needs_password?(user, params)
      params[:password].present?
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :salt, :encrypted_password, :role_id)
    end
end
