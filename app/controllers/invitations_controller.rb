class InvitationsController < ApplicationController

	def create
		invitation = Invitation.create invitation_params
		render json: invitation
	end

	def show
		invitation = Invitation.find params[:id]
		render json: invitation
	end

	def update
		invitation = Invitation.update params[:id],invitation_params
		KeenHandler.new.invitation_visit invitation.reload
		render json: invitation
	end

	def invitation_params
		params.require(:invitation).permit :referrer_id,:referral_email,:referral_id
	end

end