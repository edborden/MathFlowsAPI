class AuthenticatedController < ApplicationController
	before_filter :ensure_authenticated_user

	def ensure_authenticated_user
		head :unauthorized unless current_user
	end

	def current_session
		@current_session ||= Session.find_by_token token
	end

	def current_user
		@current_user ||= current_session.try :user
	end

	def token
		bearer = request.headers["HTTP_AUTHORIZATION"]
		bearer ||= request.headers["rack.session"].try(:[], 'Authorization')
		if bearer.present?
			bearer.split.last
		elsif params[:token]
			params[:token]
		else
			nil
		end
	end

end