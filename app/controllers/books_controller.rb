class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  	@newbook = Book.new
  end
  def create
  	newbook = Book.new(newbook_params)
  	if newbook.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(newbook)
	else
		redirect_to book_path("/books")
	end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		flash[:notice] = "Book was successfully updated"
  		redirect_to book_path(book)
  	else
  		redirect_to book_path(book)
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  		flash[:notice] = "Book was successfully destroyed"
  		redirect_to "/books"
  	else
  		redirect_to "/books"
  	end
  end

private
  def newbook_params
  	params.require(:book).permit(:title,:body)
  end
    def book_params
  	params.require(:book).permit(:title,:body)
  end


end
