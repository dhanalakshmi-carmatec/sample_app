class Admin::UserBooksController < ApplicationController
  before_action :set_user
  before_action :set_user_book, only: [:show, :edit, :update, :destroy]

  def index
    @user_books = UserBook.all
  end
  
  def new
    @user_book = UserBook.new
  end

  def edit

  end

  def create
    @user_book = @user.user_books.new(user_params)       
      if @user_book.save
         redirect_to admin_user_user_books_path, notice: 'UserBook was successfully created.'
      else
      	flash.now[:alert] = 'UserBook not created' 
        render :new
      end
  end

  def update
      if @user.user_books.update(user_params)
         redirect_to admin_user_user_books_path, notice: 'UserBook was successfully updated.'
      else
      	flash.now[:alert] = 'UserBook not updated' 
        render :edit 
      end
  end

  def show
  end

  def destroy
    @user_book.destroy
     redirect_to admin_user_user_books_path, notice: 'UserBook was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end 
    
    def set_user_book
      @user_book = UserBook.find(params[:id])
    end

    def user_params
      params.require(:user_book).permit(:user_id, :book_id, :return_date, :shipping_address)
    end
end
