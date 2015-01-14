class SessionsController < ApplicationController
	skip_before_action :ensure_authenticated_user, except: :destroy

	def create
		if params[:session][:token] == "issue"
			user = GuestHandler.new.setup
			session = user.session
		else
			return #create session from facebook
		end
		if user.guest
			render json: session, serializer: GuestSessionSerializer, root: "session"
		else
			return #render non-guest user
		end
	end

	def index
		session = Session.find_by_token params[:token]
		if session
			user = session.user
			if user.guest
				render json: [session], each_serializer: GuestSessionSerializer, root: "sessions"
			else
				return #render non-guest user
			end
		else
			head :unauthorized
		end
	end

	def destroy
		current_user.session.destroy
		head :no_content
	end

end
