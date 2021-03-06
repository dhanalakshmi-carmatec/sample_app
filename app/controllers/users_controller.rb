class Admin::UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)       
      if @user.save
         redirect_to users_path, notice: 'User was successfully created.'
      else
      	flash.now[:alert] = 'User not created' 
        render :new
      end
  end

  def update
      if @user.update(user_params)
       redirect_to users_path, notice: 'User was successfully updated.'
      else
      	flash.now[:alert] = 'User not updated' 
        render :edit 
      end
  end

  def show
  end

  def destroy
    @user.destroy
     redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :active)
    end
end