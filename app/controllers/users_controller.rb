class UsersController < ApplicationController
	
	# need to override the update method so admins can fix accounts if users lock themselves out with 2fa enabled
	def update
	@user = User.find(params[:id])
	params[:user].delete(:password) if params[:user][:password].blank?
	params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

	if @user.update(user_params)
		flash[:notice] = "Successfully updated User."
		redirect_back(fallback_location: '/')
		else
			render :action => 'edit'
		end
	end




	private

	def user_params
		 params.require(:user).permit(:email, :password, :password_confirmation, :admin)
	end

end