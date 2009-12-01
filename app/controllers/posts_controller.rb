class PostsController < ApplicationController
  def index
    params[:page] ||= 1
    @posts = Post.paginate(:all, :page => params[:page], :per_page => 10)
  end
end
