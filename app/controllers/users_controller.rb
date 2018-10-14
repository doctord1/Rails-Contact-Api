class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/signin
  def signin
  end

  # GET /users/1/edit
  def edit
    @contact = Contact.find_by(:id)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new()
    @user.username = params[:username]
    @user.encrypted_password = params[:password]
    @user.email = params[:email]
    confirm_password = params[:confirm_password]

    if params[:password].to_s == params[:confirm_password].to_s
      @user.salt = Digest::SHA1.hexdigest("--#{params[:username]}--" )
      @user.encrypted_password = Digest::SHA1.hexdigest("--#{@user.salt}--#{params[:password]}--" )
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/api/users', notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to all_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_credentials

  end

  # authenticate by email/password
  def authenticate()
    salt = Digest::SHA1.hexdigest("--#{params[:username]}--" )
    tested_pass = Digest::SHA1.hexdigest("--#{salt}--#{params[:password]}--" )
    @user = User.find_by(:username => params[:username])
    if session[:user_id]
      redirect_to :controller => "users" , :action => "show" , :id => session[:user_id] and return
    end

    if @user && @user.encrypted_password == tested_pass
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:notice] = "You are welcome back #{@user.username}!!"
      redirect_to show_all_user_contacts_path and return
    else
      flash[:notice] = "No user was found with this email/password"
      render :action => 'signin'
    end
  end

  # does the given password match the stored encrypted password
  def authenticated?
    saved_user = User.find_by(:username => session[:post_user])
    saved_pass = saved_user.encrypted_password
    post_pass = encrypt_password_string(session[:post_pass])
  end

  def encrypt_password_string(password)
    salt = Digest::SHA1.hexdigest("--#{params[:email]}--" )
    return  Digest::SHA1.hexdigest("--#{salt}--#{password}--" )
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path , :notice => 'You have been logged out!'
  end

  def me
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:username, :email, :password)
  end
end
