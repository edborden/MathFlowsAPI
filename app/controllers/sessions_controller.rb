class SessionsController < ApplicationController
	skip_before_action :ensure_authenticated_user, except: :destroy

	def create
		if params[:session][:token] == "issue"
			user = GuestHandler.new.setup
			session = user.session
		else
			return
		end
		render json: session
	end

	def index
		session = Session.find_by_token params[:token]
		if session
			user = session.user
			render json: [session]
		else
			head :unauthorized
		end
	end

	def destroy
		current_user.session.destroy
		head :ok
	end

end
