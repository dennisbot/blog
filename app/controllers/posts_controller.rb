class PostsController < ApplicationController
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
  def show
    @post = Post.find params[:id]
    p @post
    puts "@post.to_s = #{@post.to_s}"
  end
end
