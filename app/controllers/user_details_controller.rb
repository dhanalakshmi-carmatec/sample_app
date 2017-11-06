class Admin::UserDetailsController < ApplicationController
  before_action :set_user
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy]

  def index
    @user_details = UserDetail.all
  end
  
  def new
    @user_detail = UserDetail.new
  end

  def edit

  end

  def create
    @user_detail = @user.user_details.new(user_params)       
      if @user_detail.save
         redirect_to user_details_path, notice: 'UserDetail was successfully created.'
      else
      	flash.now[:alert] = 'UserDetail not created' 
        render :new
      end
  end

  def update
      if @user.user_details.update(user_params)
         redirect_to user_details_path, notice: 'UserDetail was successfully updated.'
      else
      	flash.now[:alert] = 'UserDetail not updated' 
        render :edit 
      end
  end

  def show
  end

  def destroy
    @user_detail.destroy
     redirect_to user_details_path, notice: 'UserDetail was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end 
    
    def set_user_detail
      @user_detail = UserDetail.find(params[:id])
    end

    def user_params
      params.require(:user_detail).permit(:user_id, :book_id, :return_date)
    end
end
