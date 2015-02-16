class InvitationsController < ApplicationController

	def create
		invitation = Invitation.create referrer_id:current_user.id,referral_email:params[:invitation][:referral_email]
		render json: invitation
	end

end