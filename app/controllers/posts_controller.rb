class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :delete]

  # ======= GET /posts =======
  # ======= GET /posts.json =======
  def index
    puts "******* index *******"
    @posts = Post.all
  end

  # ======= GET /posts/1 =======
  # ======= GET /posts/1.json =======
  def show
    puts "******* show *******"
  end

  # ======= GET /posts/new =======
  def new
    puts "******* new *******"
    @post = Post.new
  end

  # ======= GET /posts/1/edit =======
  def edit
    puts "******* edit *******"
    @user = User.find(params[:id])

  end

  # ======= POST /posts =======
  # ======= POST /posts.json =======
  def create
    puts "******* create *******"
    @post = Post.new(post_params)
    puts "** @post: #{@post}"
    puts "** post_params: #{post_params}"

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # ======= PATCH/PUT /posts/1 =======
  # ======= PATCH/PUT /posts/1.json =======
  def update
    puts "******* update *******"
    respond_to do |format|
      if @post.update(post_params)
        redirect_to user_posts_path(user_id: session[:user_id]) #:flash => { :success => "Welcome!" }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # ======= DELETE /posts/1 =======
  # ======= DELETE /posts/1.json =======
  def delete
    puts "******* delete *******"
    @post.delete
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)

    end
end
