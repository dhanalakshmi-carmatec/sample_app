class UserDetailsController < ApplicationController
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy]

  def index
    @user_details = UserDetail.all
    @categories = Category.all
  end
  
  def new
    @user_detail = UserDetail.new
  end

  def edit
  end

  def create
    @user_detail = UserDetail.new(user_params)       
      if @user_detail.save
         redirect_to user_details_path, notice: 'User was successfully created.'
      else
      	flash.now[:alert] = 'User not created' 
        render :new
      end
  end

  def update
      if @user_detail.update(user_params)
         redirect_to user_details_path, notice: 'User was successfully updated.'
      else
      	flash.now[:alert] = 'User not updated' 
        render :edit 
      end
  end

  def show
  end

  def destroy
    @user_detail.destroy
     redirect_to user_details_path, notice: 'User was successfully destroyed.'
  end

  private
    def set_user_detail
      @user_detail = User.find(params[:id])
    end

    def user_params
      params.require(:user_detail).permit(:category_id, :book_id, :return_date)
    end
end
