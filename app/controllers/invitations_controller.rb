class InvitationsController < ResourceController
	skip_before_action :ensure_authenticated_user, only: :visit
	skip_before_action :current_user_authorized?, only: :visit

	def create
		if User.find_by_email new_resource.referral_email
			resource.errors.add :referral_email, "already a user"
		end
		super
	end

	def visit
		Visit.new resource
		head :no_content
	end

	def resource_params
		params.require(:invitation).permit :referral_email
	end

end