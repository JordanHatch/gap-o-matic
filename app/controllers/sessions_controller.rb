class SessionsController < ApplicationController
  skip_before_filter :authenticate!
  skip_before_filter :verify_authenticity_token, only: :create

  def new
  end

  def create
    unless auth_hash.present?
      redirect_to new_session_path
      return
    end

    user = User.find_or_create_from_auth_hash(auth_hash)

    if user.persisted?
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}!"

      redirect_to root_path
    else
      flash[:alert] = "There was a problem signing you in: #{user.errors.full_messages.join(", ")}"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been signed out. See you again soon."

    redirect_to new_session_path
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end
