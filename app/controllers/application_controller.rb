class ApplicationController < ActionController::Base
include SessionsHelper
end


	def hello
		puts("Hello world")
	end
end

