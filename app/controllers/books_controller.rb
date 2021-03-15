class BooksController < ApplicationController
	before_action :find_book, only: [:show]

	def show
    if logged_in?
      @rate = current_user.rates.find_by(book_id: params[:id])
      @isInFavorite =  Favorite.find_by(book_id: params[:id], user_id: current_user.id)
    end
	end

	def index
    @search = false;
    if(params[:searchValue].present?)
      @search = true;
      @books = Book.search_book(params[:searchValue])
    else
      @categories = Category.all
      @books = Book.all.paginate(page: params[:page], per_page: 10).order('created_at desc')
      if(params[:category].present?)
        @category = Category.find_by id: params[:category]
        @books = @category.nil? ? [] : @category.books
      end
    end

    #Autocomlete search
    if(params[:data].present?)
      @books = Book.search_book(params[:data])
      render json: @books
    end

	end

	private
	def find_book
		@book = Book.find_by id: params[:id]
		unless @book.present?
			flash[:success] = "Book doesn't exist"
			redirect_to root_path
		end
	end

end
