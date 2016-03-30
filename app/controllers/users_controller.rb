class UsersController < ApplicationController
  include UsersHelper
  def new
  end

  def show
    @user = User.find(params[:id])
    if current_user.clearance == 'admin'
      puts '1'
      @user
    elsif current_user.id == @user.id
      puts '2'
      @user
    else
      puts '3'
      @user = current_user
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "signup"
    end
  end

  def update
    puts '-------------------------------------'
    puts params

    # The only way this ever gets updated is if the admin does it . If users can update their own profile then we need to change this update route completely
    @user = User.find(params[:ch_user_id])
    puts @user.id
    puts @user.clearance
    @user.update_attributes(clearance: params[:clearance])
    puts "ERRORS?: #{@user.errors.inspect}"
    puts @user.clearance
    puts @user.persisted?
    puts '-------------------------------------'
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
