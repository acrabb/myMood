class UserController < ApplicationController
  def index
  end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to @user  #user homepage
		else
			render 'new'
		end
	end
end
