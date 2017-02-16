class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]

  # ======= GET /user =======
  # ======= GET /user/.json =======
  def signin
    puts "******* signin *******"
    puts "** signin_params.inspect: #{signin_params.inspect}"
    @user = User.where(username: signin_params[:username]).first
    puts "\n******* USER OK *******"
    if @user && User.where(password: signin_params[:password])
      puts "\n******* PSWD OK *******"
      puts "** @user.inspect: #{@user.inspect}"
      puts "** @user[:id].inspect: #{@user[:id].inspect}"
      session[:user_id] = @user.id
      puts " ** session[:user_id]: #{session[:user_id]}"
      redirect_to user_posts_path(user_id: @user.id) #:flash => { :success => "Welcome!" }
    else
      redirect_to "/"
    end
  end

  # ======= GET /users =======
  def signout
    puts "******* signout *******"
    session[:user_id] = nil
    redirect_to "/"
  end

  # ======= GET /users =======
  # ======= GET /users.json =======
  def index
    puts "******* index *******"
  end

  # ======= GET /home =======
  # ======= GET /home.json =======
  def home
    puts "******* home *******"
    @user = User.new
    @users = User.all
  end

  # ======= GET /users/1 =======
  # ======= GET /users/1.json =======
  def show
    puts "******* show *******"
    puts " ** session[:user_id]: #{session[:user_id]}"
    @posts = Post.all
    puts "** @posts: #{@posts}"
    puts "** @posts.length: #{@posts.length}"
  end

  # ======= GET /users/new =======
  def new
    puts "******* new *******"
    @user = User.new
  end

  # ======= GET /users/1/edit =======
  def edit
    puts "******* edit *******"
  end

  # ======= POST /users =======
  # ======= POST /users.json =======
  def create
    puts "******* create *******"
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # ======= PATCH/PUT /users/1 =======
  # ======= PATCH/PUT /users/1.json =======
  def update
    puts "******* update *******"
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

  # ======= DELETE /users/1 =======
  # ======= DELETE /users/1.json =======
  def delete
    puts "******* delete *******"
    @user.delete
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def signin_params
      puts "******* signin_params *******"
      params.permit(:username, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
