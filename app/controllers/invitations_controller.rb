class InvitationsController < ApplicationController

	def create
		Mailer.new.invitation params[:invitation][:email],current_user
		head :no_content
	end

end