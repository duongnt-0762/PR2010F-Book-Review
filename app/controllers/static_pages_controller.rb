class StaticPagesController < ApplicationController
	def home
    @book = Book.all.take(2)
	end

	def help
	end

	def about
	end

	def contact
	end
end
