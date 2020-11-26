class UsersController < ApplicationController
def show
  	@user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
end

def edit
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.all
if  @user ==current_user
else
    redirect_to(user_url(current_user)) unless @user == current_user
end
end

def update
     @post = Post.new
  	  @user = User.find(params[:id])
      @users = User.all
if @user.update(user_params)
    flash[:notice]="successfully"
    redirect_to user_path(@user.id)
else
    flash[:notice]="error"
    render :index
end
end

def new
    @user = User.new
end

def index
    @post = Post.new
    @posts = Post.all
     @users = User.all
     @user =current_user
     @post.user_id = current_user.id
end

def following
    @users = User.find(params[:id]).followings
end


def followers
    @users = User.find(params[:id]).followers
end
    
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
