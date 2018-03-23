class SessionsController < ApplicationController

  def new
  end

  def create
    if !params[:user][:name].empty?
      user = User.find_by(:name => params[:user][:name])
      if !user.nil?
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render :new
      end
    end
  end

  def destroy
    if !!current_user
      session.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
