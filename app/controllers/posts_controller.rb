class PostsController < ApplicationController
  http_basic_authenticate_with name: "dennisbot", password: "flor2flor", except: [:index, :show]
  def index
   @posts = Post.all 
  end
  def new
  end
  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.save
    # render locals: { text: params[:post].inspect}
    redirect_to :action => :show, :id => @post.id
  end
  def edit
    @post = Post.find params[:id]
  end
  def update
    @post = Post.find params[:id]
    if @post.update post_params
      redirect_to @post
    else
      render "edit"
    end
  end
  def show
    @post = Post.find params[:id]
  end
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to @post
  end
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
