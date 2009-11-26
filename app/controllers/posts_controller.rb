class PostsController < ApplicationController
  def index
    @posts = Post.find(:all, :limit => 3)
  end

end
