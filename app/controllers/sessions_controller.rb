class SessionsController < ApplicationController
  skip_before_filter :login_required

  def new
  end
  
  def create
    user = User.authenticate(params[:email_address], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "Your account could not be authenticated."
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out."
    redirect_to root_url
  end
end
