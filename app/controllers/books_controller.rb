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
  	redirect_to '/books'
  end

  def show
  	  	@books = Book.all
  end

  def edit
  end

private
  def newbook_params
  	params.require(:book).permit(:title,:body)
  end


end
