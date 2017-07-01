class UsersController < ApplicationController
	before_action :authenticate_user!, :except => [:show]

	def show
		@user = current_user.id
	end
	
end
