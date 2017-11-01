class BooksController < ApplicationController
 before_action :set_category	
 before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = @category.books
  end
  
  def show
  end
  
  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = @category.books.new(book_params)
      if @book.save
         redirect_to category_books_path, notice: 'Book was successfully created.'
      else
        render :new, alert: 'Book not created' 
      end
  end

  def update
      if @book.update(book_params)
       redirect_to category_books_path, notice: 'Book was successfully updated.'
      else
        render :edit, alert: 'Book not updated'  
      end
  end

  def destroy
    @book.destroy
     redirect_to category_books_path, notice: 'Book was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end
    
    def set_book
      @book = @category.books.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:category_id, :name, :description)
    end
end