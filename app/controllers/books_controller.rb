class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@newbook = Book.new
  end
  def create
  	newbook = Book.new(newbook_params)
  	newbook.save
  	redirect_to book_path(newbook)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to "/books"
  end

private
  def newbook_params
  	params.require(:book).permit(:title,:body)
  end
    def book_params
  	params.require(:book).permit(:title,:body)
  end


end
