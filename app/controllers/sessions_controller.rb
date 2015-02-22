class SessionsController < ApplicationController
	include AddHeader
	skip_before_action :ensure_authenticated_user, except: :destroy

	def create
		if params[:session][:token] == "issue"
			user = Waterfall.new.user(MasterMold.new.fresh_user)
			#AddHeader::to_this user.folders.first.flows.first.documents.first.pages.first
			session = user.create_session
		else 
			google = GoogleHandler.new.user_authorized(params[:session][:token],params[:session][:redirect_uri])
			user = User.find_by google_id: google.userinfo.id
			unless user
				user = current_user.set_attrs_from_google google 
				MailchimpHandler.new.subscribe user
				Mailer.new.welcome user
				user.invitation.try :set_signup
				KeenHandler.new.signup user
			end
			user.session.try :destroy
			session = user.create_session
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
		head :no_content
	end

end
