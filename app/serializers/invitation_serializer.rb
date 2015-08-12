class InvitationSerializer < ApplicationSerializer
	attributes :referral_email,:updated_at,:signed_up,:visited
	has_one :referrer
	has_one :referral
end