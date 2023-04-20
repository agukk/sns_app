class PostsController < ActionController::Base
  def index
    @posts = Post.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "投稿しました!"
      redirect_to root_path
    else
      flash.now[:error] = "投稿に失敗しました。"
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
