class PostsController < ApplicationController
  skip_before_filter :login_required, :only => [:index]

  def index
    fetch_posts
  end

  def create
    @post = current_user.posts.build(params[:post])

    if @post.save
      flash[:success] = "Your post was added."
      redirect_to posts_path
    else
      flash[:error] = "It looks like your post couldn't be saved."
      fetch_posts
      render :index
    end
  end

protected
  def fetch_posts
    params[:page] ||= 1

    if params[:tags]
      @posts = Post.find_tagged_with(params[:tags]).paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.paginate(:all, :page => params[:page], :per_page => 10)
    end
  end
end
