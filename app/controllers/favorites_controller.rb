class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favo = Favorite.new(book_id: book.id)
    favo.user_id = current_user.id
    favo.save!
    redirect_back(fallback_location: root_path)

  end
  
  def destroy
    book = Book.find(params[:book_id])
    favo = Favorite.find_by(book_id: book.id)
    favo.user_id = current_user.id
    favo.destroy
    redirect_back(fallback_location: root_path)
  end
end
