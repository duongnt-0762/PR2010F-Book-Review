class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  before_action :find_favorite, only: [:destroy]

  def index
    @favorite = Favorite.where(user_id: current_user.id)
  end

  def create
    params[:favorite][:user_id] = current_user.id
    @isInFavorite =  Favorite.find_by(book_id: params[:id], user_id: current_user.id)
    @fav = Favorite.new favorite_params
    if @fav.save && @isInFavorite.nil?
      # flash[:success]="Added to favorite"
      # notification in js file
      render json: @fav
    else
      # flash[:danger] = "Add failed"
      redirect_to
    end
  end

  def destroy
    @favorite.destroy
    flash[:success] = "Book deleted"
    redirect_to favorites_path
  end

  private
    def find_favorite
      @favorite =  Favorite.find_by id: params[:id]
      unless @favorite.present?
        flash[:danger] = "Book doesn't exist"
        redirect_to favorites_path
      end
    end

    def favorite_params
      params.require(:favorite).permit(:user_id, :book_id)
    end
end
