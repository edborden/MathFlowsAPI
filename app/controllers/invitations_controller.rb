class InvitationsController < ResourceController

	def update
		invitation = Invitation.update params[:id],resource_params
		KeenHandler.new.handle :invitation_visit, invitation.reload
		render json: invitation
	end

	def resource_params
		params.require(:invitation).permit :referrer_id,:referral_email,:referral_id
	end

end