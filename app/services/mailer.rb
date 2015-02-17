class Mailer < MandrillMailer::TemplateMailer
	default from: "support@mathflows.com"
	default from_name: "MathFlows"

	def welcome user
		mandrill_mail( template: 'welcome',
			subject: "Welcome to MathFlows",
			to: {email: user.email, name: user.name},
			important: true,
			inline_css: true,
			async: true
		).deliver
	end

	def invitation invitation
		mandrill_mail( template: 'invitation',
			subject: "#{invitation.referrer.name} invited you to MathFlows",
			to: invitation.referral_email,
			important: true,
			inline_css: true,
			vars: {'REFERRER_NAME' => invitation.referrer.name, 'INVITATION_ID' => invitation.id},
			async: true
		).deliver
	end

end