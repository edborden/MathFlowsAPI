class SessionsController < ApplicationController
	skip_before_action :ensure_authenticated_user, except: :destroy

	def create
		if params[:session][:token] == "issue"
			user = GuestHandler.new.setup
			session = user.session
		else 
			google = GoogleHandler.new.user_authorized(params[:session][:token],params[:session][:redirect_uri])
			user = User.find_by google_id: google.userinfo.id
			user = User.create_from_google google unless user
			user.session.destroy if user.session.present?
			session = user.create_session
		end
		if user.guest
			render json: session, serializer: GuestSessionSerializer, root: "session"
		else
			render json: session
		end
	end

	def index
		session = Session.find_by_token params[:token]
		if session
			user = session.user
			if user.guest
				render json: [session], each_serializer: GuestSessionSerializer, root: "sessions"
			else
				render json: [session]
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
