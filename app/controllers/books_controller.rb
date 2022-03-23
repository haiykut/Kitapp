class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.comments.each do |comment|
      comment.destroy
    end
    @book.destroy
    redirect_to root_path, status: :see_other
  end
  private
  def book_params
    params.require(:book).permit(:title, :summary, :author, :isbn)
  end
end
