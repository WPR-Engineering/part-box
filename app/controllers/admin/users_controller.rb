class Admin::UsersController < ApplicationController
	load_and_authorize_resource
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden }
			format.html { redirect_to main_app.root_url, :alert => exception.message }
		end
	end

	#get /admin/user_admins/
	def index
		@users = User.all
	end

def edit
	@user = User.find(params[:id])

	#this works, but we can do better.
	#authorize! :edit, @user
	end

	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:emai, :admin, :password)
	end
end
