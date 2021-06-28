class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    com = BookComment.new(book_comment_params)
    com.user_id = current_user.id
    com.book_id = book.id
    com.save
    
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:book_id])
    com = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    com.destroy
    
    redirect_to book_path(book.id)
  end
  
  private
  
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end
end
