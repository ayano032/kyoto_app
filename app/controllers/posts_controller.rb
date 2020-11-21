class PostsController < ApplicationController
  def new
      @post = Post.new
  end

  def create
	@post = Post.new(post_params)
	@post.user_id = current_user.id
	@posts = Post.all
	@user = current_user
	@post.save
	redirect_to posts_path
  end

  def index
	@post = Post.new
	@posts = Post.all.search(params[:search])
	@user = current_user
	@post.user_id = current_user.id
	@all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
	 @newpost = Post.new
	 @post_comment = PostComment.new
  	 @post = Post.find(params[:id])
     @user = @post.user
  end

  def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to posts_path
  end

  def edit
	@post = Post.find(params[:id])
  if @post.user ==current_user
  else
    redirect_to posts_path
  end
  end

  def update
	  @post = Post.find(params[:id])
      @posts = Post.all
      @user =current_user
   if @post.update(post_params)
       flash[:notice]="successfully"
    redirect_to post_path(@post.id)
   else
flash[:notice]="error"
render :edit
   end
  end

private
 def post_params
   params.require(:post).permit(:title,:caption,:image,:user_id)
 end
end
