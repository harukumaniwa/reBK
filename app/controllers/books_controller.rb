class BooksController < ApplicationController
  def index
    @user = current_user
    @post_books = Book.all
    @new = Book.new
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new = Book.new
    @comment = BookComment.new
    @post_com = BookComment.where(book_id: @book.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:create] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @post_books = Book.all
      @new = Book.new
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:book_update] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      
      render "edit"
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
