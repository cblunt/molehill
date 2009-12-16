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

    unless current_user.promote(@post)
      flash[:error] = "You cannot promote your own post"
    end

    redirect_to posts_path and return 
  end

  def complete
    fetch_post :scope_by_user => current_user

    if @post.complete!
      flash[:success] = "Case completed."
    else
      flash[:error] = "The case could not be completed."
    end
      
    redirect_to posts_path and return 
  end

  def decline
    fetch_post :scope_by_user => current_user

    if @post.decline!
      flash[:success] = "Case declined."
    else
      flash[:error] = "The case could not be declined."
    end
      
    redirect_to posts_path and return 
  end


protected 
  def fetch_post options = {}
    if options[:scope_by_user]
      @post = options[:scope_by_user].posts.find_by_id(params[:id])
    else
      @post = Post.find_by_id(params[:id])
    end

    if @post.nil?
      flash[:notice] = "The case could not be found."
      redirect_to posts_path and return
    end
  end

  def fetch_posts
    params[:page] ||= 1

    if params[:tag_string]
      tags = params[:tag_string].split(" ").collect { |t| "##{t}" }
      params[:tags] = tags
    end

    if params[:tags]
      @posts = Post.find_tagged_with(params[:tags]).paginate(:page => params[:page], :per_page => 10, :order => "votes_count DESC, created_at DESC")
    else
      @posts = Post.paginate(:all, :page => params[:page], :per_page => 10, :order => "votes_count DESC, created_at DESC")
    end
  end
end
