class PostsController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :show]

  def index
    fetch_posts
    @post = current_user.posts.new if logged_in?
  end

  def show
    fetch_post
  end

  def create
    @post = current_user.posts.build(params[:post])

    if @post.save
      flash[:success] = "Your post was added."

      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:error] = "It looks like your post couldn't be saved."

      respond_to do |format|
        format.html { 
          fetch_posts
          render :index 
        }

        format.js
      end
    end
  end

  def promote
    fetch_post

    @current_user.promote @post
    redirect_to posts_path and return 
  end

protected 
  def fetch_post
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      flash[:notice] = "The case could not be found."
      redirect_to posts_path and return
    end
  end

  def fetch_posts
    params[:page] ||= 1

    if params[:tags]
      @posts = Post.find_tagged_with(params[:tags]).paginate(:page => params[:page], :per_page => 10, :order => "votes_count DESC, created_at DESC")
    else
      @posts = Post.paginate(:all, :page => params[:page], :per_page => 10, :order => "votes_count DESC, created_at DESC")
    end
  end
end
