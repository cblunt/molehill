class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create, :verify]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Thank you for signing up! Please check your emails for a verification link."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def verify
    @user = User.find_by_id(params[:id])
  
    if @user and @user.verify_with_key(params[:verification_key])
      flash[:success] = "Thank you for verifying your account! You are now signed in."
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:error] = "Your account could not be verified."
      redirect_to root_url
    end
  end
end
